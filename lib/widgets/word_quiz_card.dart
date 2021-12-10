import 'package:flutter/material.dart';
import 'package:mobiteach_quiz/models/word.dart';

class WordQuizCard extends StatefulWidget {
  final Word word;
  final Function(bool) onTap;
  final bool isCorrectAnswer;

  const WordQuizCard({
    Key? key,
    required this.word,
    required this.onTap,
    required this.isCorrectAnswer,
  }) : super(key: key);

  @override
  State<WordQuizCard> createState() => _WordQuizCardState();
}

class _WordQuizCardState extends State<WordQuizCard> {
  double _initValue = 0.0;
  Color _color = Colors.transparent;
  Duration animDuration = const Duration(milliseconds: 0);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animDuration,
      width: 200.0,
      height: 80.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: _color,
          width: _initValue,
        ), // new line
      ),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            _initValue = 7.0;
            _color = _getBorderColor();
            animDuration = const Duration(milliseconds: 200);
          });
          await Future.delayed(const Duration(milliseconds: 300));
          widget.onTap(widget.isCorrectAnswer);
          setState(() {
            _initValue = 0;
            _color = Colors.transparent;
            animDuration = const Duration(milliseconds: 200);
          });
        },
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(
                "assets/images/flutter.png",
                width: 150.0,
                height: 100.0,
              ),
              Text(widget.word.translate),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBorderColor() {
    if (widget.isCorrectAnswer) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
