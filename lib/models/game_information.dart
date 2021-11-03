import 'package:shared_preferences/shared_preferences.dart';

setBestScore(int x) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('best score', x);
}

Future<int> getBestScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('best score') ?? 0;
}
