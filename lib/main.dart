import 'package:flutter/material.dart';
import 'questions.dart';

QuestionsBuilder questionBuilder = QuestionsBuilder();

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
  //final List<Questions> _questions = QuestionsBuilder;
  List<Icon> _iconWidgets = new List<Icon>();

  int questionNumber = 0;

  String getQuestion() {
    if (questionNumber >= questionBuilder.questions.length) {
      return 'Test Completato';
    }
    return questionBuilder.questions[questionNumber].question;
  }

  void fillIconList(bool answer) {
    if (questionNumber >= questionBuilder.questions.length) return;
    bool correctAnswer = questionBuilder.questions[questionNumber].answer;

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
                getQuestion(),
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
                fillIconList(true);
                setState(() {
                  questionNumber += 1;
                });
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
                fillIconList(false);

                setState(() {
                  questionNumber += 1;
                });
              },
            ),
          ),
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _iconWidgets)
      ],
    );
  }
}
