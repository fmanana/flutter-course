import 'package:flutter/material.dart';

import './answer.dart';
import './quiz.dart';
import './result.dart';
// void main()
// {
//     runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite colour?',
      'answers': [
        {'text': 'Blue', 'score': 2},
        {'text': 'Black', 'score': 10},
        {'text': 'Purple', 'score': 7}
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 2},
        {'text': 'Snake', 'score': 7},
        {'text': 'Dolphin', 'score': 9},
        {'text': 'Gibbon', 'score': 10},
      ]
    }
  ];
  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
          ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions
          )
          : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
