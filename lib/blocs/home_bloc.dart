import 'dart:async';

import 'package:mobiteach_quiz/db/word_dao.dart';
import 'package:mobiteach_quiz/models/word.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final WordDao _wordDao = WordDao();
  final _stateController = BehaviorSubject<List<Word>>();

  Stream<List<Word>> get homeState => _stateController.stream;

  Function(List<Word>) get _setState => _stateController.sink.add;

  void load() async {
    List<Word> words = await _wordDao.getAll();
    _setState(words);
  }

  void dispose() {
    if (!_stateController.isClosed) {
      _stateController.close();
    }
  }
}
