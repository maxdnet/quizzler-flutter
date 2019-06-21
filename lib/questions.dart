class Questions {
  String question;
  bool answer;

  Questions({String question, bool answer}) {
    this.question = question;
    this.answer = answer;
  }
}

class QuestionsBuilder {
  final List<Questions> questions = [
    Questions(question: 'Martina ama Massimiliano?', answer: false),
    Questions(question: 'Martina è anoressica?', answer: true),
    Questions(
        question: 'Massimiliano è pulito e un bravo piccoletto?', answer: true),
    Questions(
        question: 'Massimiliano ha comprato il condizionatore?', answer: false),
  ];
}
