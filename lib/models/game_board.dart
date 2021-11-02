import 'package:flutter/cupertino.dart';
import 'package:twenty_forty_eight/models/direction.dart';
import 'dart:math';

///  This class is models the game board.
///
///  It stores a scale * scale matrix and the current score. Use [swipe] to
///  swipe tiles up/down/left/right and they will merge automatically if it's
///  possible. Simultaneously it records the score. If two tiles whose value
///  are x merges, a new tile with value 2x appears and the score added up 2x.
///  To simplify swipe, we first tilt the game board to a certain direction,
///  swipe, and finally tilt back. The [map] stores the real game board while
///  [getTile] and [setTile] computes the game board after tilting.
class GameBoard extends ChangeNotifier {
  /// the scale of the game board.
  static const scale = 4;

  /// the probability of getting four when inserting a new random tile
  static const probabilityOfGettingFour = 0.1;

  /// the current score
  var _score = 0;

  /// the map
  List<List<int>> map =
      List.generate(scale, (i) => List.filled(scale, 0, growable: false));

  /// The direction of the game board.
  ///
  /// The game board may be tilted in order to simplify swiping
  var _direction = Direction.down;

  /// restarts the game
  ///
  /// clear the map and creates two random tiles.
  void reStart() {
    map = List.generate(scale, (i) => List.filled(scale, 0, growable: false));
    _direction = Direction.down;
    newRandomTile();
    newRandomTile();
    notifyListeners();
  }

  /// Tilts the game board to the direction.
  ///
  /// To tilt the game board to a certain direction, we just assign the property
  /// direction rather than change the map. And we access the tile after tilting
  /// by [getTile] and [setTile] where we perform the coordinate transformation
  void _tiltTo({required Direction direction}) {
    _direction = direction;
  }

  /// the current score
  int getScore() => _score;

  /// true if a index is valid
  bool _indexIsValid({required int row, required int column}) =>
      0 <= row && row < scale && 0 <= column && column < scale;

  /// the number of tile on the ith row and the jth column after the the game
  /// board tilt to the Direction.
  ///
  /// The default direction is DOWN. If the tile is empty, returns 0.
  ///          Down         Tilt to Right     Tilt to Up        Tilt to Left
  ///      +-----------+     +-----------+     +-----------+     +-----------+
  ///      | 0  1  2  3|     | c  8  4  9|     | f  e  d  c|     | 3  7  b  f|
  ///      | 4  5  6  7|     | d  9  5  1|     | b  a  9  8|     | 2  6  a  e|
  ///      | 8  9  a  b|     | e  a  6  2|     | 7  6  5  4|     | 1  5  9  d|
  ///      | c  d  e  f|     | f  b  7  3|     | 3  2  1  0|     | 0  4  8  c|
  ///      +-----------+     +-----------+     +-----------+     +-----------+
  ///
  int getTile(int i, int j) {
    assert(_indexIsValid(row: i, column: j));
    switch (_direction) {
      case Direction.down:
        {
          return map[i][j];
        }
      case Direction.up:
        {
          return map[scale - i - 1][scale - j - 1];
        }
      case Direction.left:
        {
          return map[j][scale - i - 1];
        }
      case Direction.right:
        {
          return map[scale - j - 1][i];
        }
    }
  }

  /// the number of tile on the ith row and the jth column after the the game
  /// board tilt to the Direction.
  void setTile(int i, int j, int value) {
    assert(_indexIsValid(row: i, column: j));
    switch (_direction) {
      case Direction.down:
        {
          map[i][j] = value;
        }
        break;
      case Direction.up:
        {
          map[scale - i - 1][scale - j - 1] = value;
        }
        break;
      case Direction.left:
        {
          map[j][scale - i - 1] = value;
        }
        break;
      case Direction.right:
        {
          map[scale - j - 1][i] = value;
        }
        break;
    }
  }

  /// insert a new random tile into the game board. It will be 4 with a
  /// probability of [probabilityOfGettingFour] and otherwise it will be 2
  void newRandomTile() {
    int i, j;
    final generator = Random();
    do {
      i = generator.nextInt(scale);
      j = generator.nextInt(scale);
    } while (getTile(i, j) != 0);
    setTile(i, j, generator.nextDouble() < probabilityOfGettingFour ? 4 : 2);
    notifyListeners();
  }

  /// true if the game board is still operable.
  ///
  /// by swiping up/down/right/left, the game board will change.
  /// In short, if there's empty tile or two neighboring tiles are same, returns
  /// true, otherwise returns false
  bool operable() {
    for (int i = 0; i < scale; ++i) {
      for (int j = 0; j < scale; ++j) {
        if (getTile(i, j) == 0) {
          return true;
        }
        if (i != 0 && getTile(i - 1, j) == getTile(i, j)) {
          return true;
        }
        if (j != 0 && getTile(i, j - 1) == getTile(i, j)) {
          return true;
        }
      }
    }
    return false;
  }

  /// move a tile from (x, y) to (newX, newY) and merge them if it's possible.
  /// Also add up score when merging
  void _move(int x, int y, int newX, int newY) {
    assert(_indexIsValid(row: x, column: y));
    assert(_indexIsValid(row: newX, column: newY));
    assert((x == newX || y == newY) &&
        ((getTile(x, y) == getTile(newX, newY) || getTile(newX, newY) == 0)));
    assert(getTile(x, y) != 0);

    if (x == newX && y == newY) {
      return;
    }
    if (getTile(x, y) == getTile(newX, newY)) {
      setTile(newX, newY, 2 * getTile(newX, newY));
      _score += getTile(newX, newY);
    } else if (getTile(newX, newY) == 0) {
      setTile(newX, newY, getTile(x, y));
    }
    setTile(x, y, 0);
  }

  /// swipe down the tiles and merge tiles. Also add up score when merge.
  bool _swipeDown() {
    bool succeed = false;
    for (int j = 0; j < scale; ++j) {
      int last = scale - 1;
      for (int i = scale - 1; i >= 0; --i) {
        if (getTile(i, j) != 0 && last != i) {
          if (getTile(i, j) == getTile(last, j)) {
            _move(i, j, last, j);
            last -= 1;
            succeed = true;
          } else if (getTile(last, j) == 0) {
            _move(i, j, last, j);
            succeed = true;
          } else {
            if (i != last - 1) {
              _move(i, j, last - 1, j);
              succeed = true;
            }
            last -= 1;
          }
        }
      }
    }
    return succeed;
  }

  /// swipe the game board to the direction. To simplify code complexity, we
  /// first tilt the game board to the direction and then swipe down. Finally
  /// we tilt back.
  bool swipe({required Direction direction}) {
    assert(operable());
    _tiltTo(direction: direction);
    bool succeed = _swipeDown();
    _tiltTo(direction: Direction.down);
    return succeed;
  }
}
