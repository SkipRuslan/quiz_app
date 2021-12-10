import 'package:flutter/material.dart';
import 'package:mobiteach_quiz/models/word.dart';
import 'package:mobiteach_quiz/resources/app_colors.dart';
import 'package:mobiteach_quiz/widgets/word_quiz_card.dart';

class QuizWidget extends StatelessWidget {
  final List<Word> generatedWordsList;
  final Function(bool) onTap;
  final Word questionWord;

  const QuizWidget({Key? key, required this.generatedWordsList, required this.onTap, required this.questionWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(70.0),
          width: 200.0,
          height: 60.0,
          color: AppColors.grey,
          child: Align(
            alignment: Alignment.center,
            child: Text(questionWord.word),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: generatedWordsList.length,
            itemBuilder: (BuildContext ctx, index) {
              return WordQuizCard(
                word: generatedWordsList[index],
                onTap: onTap,
                isCorrectAnswer: questionWord.translate == generatedWordsList[index].translate,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
      ],
    );
  }
}
