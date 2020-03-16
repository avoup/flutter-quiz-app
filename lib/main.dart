import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what is you?',
      'answers': [
//        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 5},
        {'text': 'chicken', 'score': 2},
        {'text': 'stuffed turkey', 'score': 0}
      ]
    },
    {
      'questionText': 'really?',
      'answers': [
        {'text': 'yea', 'score': 10},
        {'text': '...', 'score': 5},
        {'text': 'eggs', 'score': 2},
        {'text': 'scrambled eggs', 'score': 0}
      ]
    },
    {
      'questionText': '...?',
      'answers': [
        {'text': '....', 'score': 10},
        {'text': '...', 'score': 5},
        {'text': '..', 'score': 2},
        {'text': 'rotisary chicken', 'score': 0}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _reset() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
      print(_questionIndex);
    });
    if (_questionIndex < _questions.length) {
      print('end');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('stuff'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}
