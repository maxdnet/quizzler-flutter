class Questions {
  String question;
  bool answer;

  Questions({String question, bool answer}) {
    this.question = question;
    this.answer = answer;
  }
}

class QuestionsBuilder {
  int _questionNumber = 0;

  List<Questions> _questions = [
    Questions(question: 'Martina ama Massimiliano?', answer: false),
    Questions(question: 'Martina è anoressica?', answer: true),
    Questions(
        question: 'Massimiliano è pulito e un bravo piccoletto?', answer: true),
    Questions(
        question: 'Massimiliano ha comprato il condizionatore?', answer: false),
  ];

  void getNextQuestion() {
    if (anyMoreQuestions()) _questionNumber++;
  }

  String getQuestion() {
    if (!anyMoreQuestions()) return 'Test Completato';
    return _questions[_questionNumber].question;
  }

  bool getAnswer() {
    return _questions[_questionNumber].answer;
  }

  bool anyMoreQuestions() {
    return (_questionNumber < _questions.length);
  }

  void restQuestions() {
    _questionNumber = 0;
  }
}
