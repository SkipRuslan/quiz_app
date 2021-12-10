import 'package:flutter/material.dart';
import 'package:mobiteach_quiz/resources/app_strings.dart';
import 'package:mobiteach_quiz/screens/home_screen.dart';

class ResultsScreen extends StatefulWidget {
  final int rightAnswers;

  const ResultsScreen({Key? key, required this.rightAnswers}) : super(key: key);
  static const String route = "results_screen";

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.resultsScreen),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("${widget.rightAnswers.toString()}/5(${(widget.rightAnswers / 5 * 100).toInt()}%)"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.route);
              },
              child: const Text(AppStrings.returnToHomeScreen),
            ),
          ],
        ),
      ),
    );
  }
}
