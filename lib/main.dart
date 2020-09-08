import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answer': [
        {'text': 'Black', 'score': 3},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 8},
        {'text': 'Blue', 'score': 20},
        {'text': 'Purple', 'score': 3},
        {'text': 'White', 'score': 9},
        {'text': 'orange', 'score': 7},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal ?',
      'answer': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Lion', 'score': 10},
        {'text': 'Dogs', 'score': 8},
        {'text': 'Squirrel', 'score': 8},
      ],
    },
    {
      'questionText': 'who\'s is your favorite instructor?',
      'answer': [
        {'text': 'Lucy', 'score': 8},
        {'text': 'Max', 'score': 3},
        {'text': 'Sam', 'score': 9},
        {'text': 'Mike', 'score': 6},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resettQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _ansQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    /** questions = []; this doesn't work if question is const, and const 
     *help us to avoid making of copies of the same variable which we don't want. const is a compile time variable. */

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                ansQuestion: _ansQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resettQuiz),
      ),
    );
  }
}
