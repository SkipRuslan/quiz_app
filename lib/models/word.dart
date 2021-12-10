class Word {
  int? id;
  String image = "assets/images/flutter.png";
  final String word;
  final String translate;
  Participation participation = Participation.none;

  Word({required this.word, required this.translate});

  Map<String, dynamic> toMap() {
    return {
      "word": word,
      "translate": translate};
  }

  static Word fromJson(Map<String, dynamic> map) {
    return Word(
        word: map["word"],
        translate:map["translate"]);
  }
}

enum Participation {none, correct, incorrect}
