import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questions.dart';
import 'answer.dart';

QuestionsBuilder questionBuilder = QuestionsBuilder();
AnswerBuilder answerBuilder = AnswerBuilder();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void resetQuizzer() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Test Completato",
      desc: "Clicca OK per resettare le domande.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(
              () {
                questionBuilder.restQuestions();
                answerBuilder.resetAnswer();
              },
            );
          },
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBuilder.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Vero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (questionBuilder.anyMoreQuestions()) {
                  answerBuilder.addAnswer(true, questionBuilder.getAnswer());
                  setState(() {
                    questionBuilder.getNextQuestion();
                  });
                } else {
                  setState(
                    () {
                      resetQuizzer();
                    },
                  );
                }
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (questionBuilder.anyMoreQuestions()) {
                  answerBuilder.addAnswer(false, questionBuilder.getAnswer());
                  setState(() {
                    questionBuilder.getNextQuestion();
                  });
                } else {
                  setState(
                    () {
                      resetQuizzer();
                    },
                  );
                }
              },
            ),
          ),
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: answerBuilder.getAnswers())
      ],
    );
  }
}
