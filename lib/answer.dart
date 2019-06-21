import 'package:flutter/material.dart';

class AnswerBuilder {
  List<Icon> _iconWidgets = List<Icon>();

  List<Icon> getAnswers() {
    return _iconWidgets;
  }

  void addAnswer(bool answer, bool correctAnswer) {
    if (answer == correctAnswer)
      _iconWidgets.add(Icon(
        Icons.check,
        color: Colors.green,
        size: 30.0,
      ));
    else
      _iconWidgets.add(Icon(
        Icons.close,
        color: Colors.red,
        size: 30.0,
      ));
  }
}
