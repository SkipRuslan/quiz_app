import 'dart:async';
import 'package:mobiteach_quiz/db/word_dao.dart';
import 'package:mobiteach_quiz/models/word.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AppDatabase {
  List<Map<String, Object?>> initList = [
    Word(word: "dog", translate: "собака").toMap(),
    Word(word: "cat", translate: "кішка").toMap(),
    Word(word: "father", translate: "батько").toMap(),
    Word(word: "mother", translate: "мати").toMap(),
    Word(word: "bird", translate: "пташка").toMap(),
    Word(word: "aunt", translate: "тітка").toMap(),
    Word(word: "leg", translate: "нога").toMap(),
    Word(word: "body", translate: "тіло").toMap(),
    Word(word: "head", translate: "голова").toMap(),
    Word(word: "wind", translate: "вітер").toMap(),
    Word(word: "finger", translate: "палець").toMap(),
    Word(word: "mouse", translate: "миша").toMap(),
    Word(word: "ear", translate: "вухо").toMap(),
    Word(word: "eye", translate: "око").toMap(),
    Word(word: "scroll", translate: "прогортати").toMap(),
    Word(word: "cube", translate: "куб").toMap(),
    Word(word: "pen", translate: "ручка").toMap(),
    Word(word: "son", translate: "син").toMap(),
    Word(word: "brother", translate: "брат").toMap(),
    Word(word: "bed", translate: "ліжко").toMap(),
  ];
  static final AppDatabase _singlton = AppDatabase._();

  static AppDatabase get instance => _singlton;

  Completer<Database>? _dbOpenCompleter;

  AppDatabase._();

  final WordDao _wordDao = WordDao();

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      await _openDatabase();
      await _wordDao.addInitList(initList);
    }
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumentDir.path, 'demo.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter!.complete(database);
  }
}
