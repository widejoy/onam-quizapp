class BluePrint {
  const BluePrint(this.text, this.answers);

  final String text;
  final List<String> answers;
  List<String> ShuffledAnswers() {
    final shuffle = List.of(answers);
    shuffle.shuffle();
    return shuffle;
  }
}
