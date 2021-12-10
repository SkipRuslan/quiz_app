import 'dart:async';
import 'dart:math';
import 'package:mobiteach_quiz/models/word.dart';
import 'package:rxdart/rxdart.dart';

class QuizBloc {
  Random rnd = Random();
  final _stateController = BehaviorSubject<List<Word>>();

  Stream<List<Word>> get quizState => _stateController.stream;

  Function(List<Word>) get _setState => _stateController.sink.add;

  Future<void> getRandomFourWords(List<Word> wordsList) async {
    List<Word> fourWords = [];
    for (int i = 0; i < 4; ++i) {
      fourWords.add(wordsList[rnd.nextInt(19)]);
    }
    _setState(fourWords);
  }

  void dispose() {
    if (!_stateController.isClosed) {
      _stateController.close();
    }
  }
}
