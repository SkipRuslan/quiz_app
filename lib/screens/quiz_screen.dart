import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobiteach_quiz/blocs/quiz_bloc.dart';
import 'package:mobiteach_quiz/models/word.dart';
import 'package:mobiteach_quiz/resources/app_strings.dart';
import 'package:mobiteach_quiz/screens/results_screen.dart';
import 'package:mobiteach_quiz/widgets/quiz_widget.dart';

class QuizScreen extends StatefulWidget {
  final List<Word> list;

  const QuizScreen({
    Key? key,
    required this.list,
  }) : super(key: key);
  static const String route = "word_quiz_card";

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizBloc _quizBloc = QuizBloc();
  int _questionsCount = 0;
  int _rightAnswers = 0;
  Random rnd = Random();

  @override
  void initState() {
    super.initState();
    _quizBloc.getRandomFourWords(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.quizScreen),
      ),
      body: StreamBuilder<List<Word>>(
        stream: _quizBloc.quizState,
        builder: (context, snap) {
          if (snap.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return QuizWidget(
              questionWord: snap.data![rnd.nextInt(4)],
              generatedWordsList: snap.data!,
              onTap: isAnswerCorrect,
            );
          }
        },
      ),
    );
  }

  void isAnswerCorrect(bool isCorrect) {
    _quizBloc.getRandomFourWords(widget.list);
    setState(() {
      if (isCorrect) {
        _rightAnswers++;
      }
      _questionsCount++;
    });
    if (_questionsCount >= 5) {
      Navigator.of(context).pushNamed(ResultsScreen.route, arguments: _rightAnswers);
    }
  }
}
