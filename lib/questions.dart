class Questions {
  String question;
  bool answer;

  Questions(this.question, this.answer);
}

class QuestionsBuilder {
  int _questionNumber = 0;

  List<Questions> _questions = [
    Questions('Martina ama Massimiliano?', false),
    Questions('Martina è anoressica?', true),
    Questions('Massimiliano è pulito e un bravo piccoletto?', true),
    Questions('Massimiliano ha comprato il condizionatore?', false),
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
