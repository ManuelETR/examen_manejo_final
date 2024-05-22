import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _keyCorrectAnswers = 'correct_answers';
  static const String _keyIncorrectAnswers = 'incorrect_answers';

  static Future<void> saveResults(int correctAnswers, int incorrectAnswers) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_keyCorrectAnswers, correctAnswers);
    prefs.setInt(_keyIncorrectAnswers, incorrectAnswers);
  }

  static Future<Map<String, int>> getResults() async {
    final prefs = await SharedPreferences.getInstance();
    final correctAnswers = prefs.getInt(_keyCorrectAnswers) ?? 0;
    final incorrectAnswers = prefs.getInt(_keyIncorrectAnswers) ?? 0;
    return {'correct_answers': correctAnswers, 'incorrect_answers': incorrectAnswers};
  }
}
