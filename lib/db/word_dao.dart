import 'package:mobiteach_quiz/models/word.dart';
import 'package:sembast/sembast.dart';
import 'app_database.dart';

class WordDao {
  static const String WORD_STORE = 'words';

  final _wordStore = intMapStoreFactory.store(WORD_STORE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future update({required Word word, required int id}) async {
    await _wordStore.update(
      await _db,
      word.toMap(),
    );
  }

  Future<List<Word>> getAll() async {
    final recordSnapshots = await _wordStore.find(
      await _db,
    );

    return recordSnapshots.map((snapshot) => Word.fromJson(snapshot.value)..id = snapshot.key).toList();
  }

  Future<Word> getWord(int id) async {
    var map = await _wordStore.record(id).get(await _db);
    return Word.fromJson(map!);
  }

  Future<void> addInitList(List<Map<String, Object?>> list) async {
    await _wordStore.addAll(await _db, list);
  }
}
