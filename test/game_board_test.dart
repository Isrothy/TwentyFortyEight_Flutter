import 'package:flutter_test/flutter_test.dart';
import 'package:twenty_forty_eight/models/direction.dart';
import 'package:twenty_forty_eight/models/game_board.dart';

void main() {
  test('swipe down', () {
    final GameBoard gameBoard = GameBoard();
    gameBoard.map = [
      [0, 4, 0, 4],
      [0, 2, 0, 2],
      [2, 0, 0, 4],
      [4, 0, 0, 8]
    ];
    gameBoard.swipe(direction: Direction.down);
    expect(gameBoard.map, [
      [0, 0, 0, 4],
      [0, 0, 0, 2],
      [2, 4, 0, 4],
      [4, 2, 0, 8]
    ]);
    expect(gameBoard.getScore(), 0);

    gameBoard.map = [
      [2, 2, 4, 2],
      [2, 4, 0, 2],
      [4, 8, 0, 2],
      [4, 16, 4, 2]
    ];
    gameBoard.swipe(direction: Direction.down);
    expect(gameBoard.map, [
      [0, 2, 0, 0],
      [0, 4, 0, 0],
      [4, 8, 0, 4],
      [8, 16, 8, 4]
    ]);
    expect(gameBoard.getScore(), 28);
  });

  test('swipe', () {
    final GameBoard gameBoard = GameBoard();
    gameBoard.map = [
      [0, 0, 2, 4],
      [0, 0, 4, 8],
      [0, 2, 0, 2],
      [0, 0, 0, 8]
    ];
    gameBoard.swipe(direction: Direction.right);
    expect(gameBoard.map, [
      [0, 0, 2, 4],
      [0, 0, 4, 8],
      [0, 0, 0, 4],
      [0, 0, 0, 8]
    ]);
    expect(gameBoard.getScore(), 4);

    gameBoard.map = [
      [2, 0, 2, 2],
      [2, 4, 0, 4],
      [4, 8, 16, 16],
      [0, 4, 0, 4]
    ];
    gameBoard.swipe(direction: Direction.left);
    expect(gameBoard.map, [
      [4, 2, 0, 0],
      [2, 8, 0, 0],
      [4, 8, 32, 0],
      [8, 0, 0, 0]
    ]);
    expect(gameBoard.getScore(), 56);

    gameBoard.map = [
      [2, 4, 4, 4],
      [4, 8, 4, 0],
      [16, 0, 8, 0],
      [0, 8, 0, 2]
    ];
    gameBoard.swipe(direction: Direction.up);
    expect(gameBoard.map, [
      [2, 4, 8, 4],
      [4, 16, 8, 2],
      [16, 0, 0, 0],
      [0, 0, 0, 0]
    ]);
    expect(gameBoard.getScore(), 80);
  });

  test('operable', () {
    final GameBoard gameBoard = GameBoard();
    gameBoard.map = [
      [0, 2, 2, 4],
      [2, 2, 8, 16],
      [2, 4, 32, 128],
      [0, 2, 4, 32]
    ];
    expect(gameBoard.operable(), true);

    gameBoard.map = [
      [4, 2, 4, 2],
      [2, 4, 2, 16],
      [4, 8, 32, 128],
      [0, 4, 8, 32]
    ];
    expect(gameBoard.operable(), true);

    gameBoard.map = [
      [4, 2, 4, 2],
      [2, 4, 2, 16],
      [4, 8, 32, 128],
      [4, 2, 8, 32]
    ];
    expect(gameBoard.operable(), true);

    gameBoard.map = [
      [4, 2, 4, 2],
      [2, 4, 2, 16],
      [4, 8, 32, 128],
      [8, 4, 8, 32]
    ];
    expect(gameBoard.operable(), false);
  });
}
