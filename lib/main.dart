import 'package:flutter/material.dart';
import 'package:mobiteach_quiz/screens/home_screen.dart';
import 'package:mobiteach_quiz/screens/quiz_screen.dart';
import 'package:mobiteach_quiz/screens/results_screen.dart';

import 'models/word.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.route,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    Widget screen = const HomeScreen();
    switch (settings.name) {
      case HomeScreen.route:
        screen = const HomeScreen();
        break;
      case QuizScreen.route:
        List<Word> list = settings.arguments as List<Word>;
        screen = QuizScreen(
          list: list,
        );
        break;
      case ResultsScreen.route:
        int rightAnswers = settings.arguments as int;
        screen = ResultsScreen(
          rightAnswers: rightAnswers,
        );
        break;
    }
    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
