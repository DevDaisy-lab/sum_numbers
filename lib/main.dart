import 'package:flutter/material.dart';

import 'package:sum_numbers/quiz.dart';
import './result.dart';

void main() => runApp(SumOfNumbers());

class SumOfNumbers extends StatefulWidget {
  @override
  _SumOfNumbersState createState() => _SumOfNumbersState();
}

class _SumOfNumbersState extends State<SumOfNumbers> {
  final _tasks = const [
    {
      'taskText': 'Your Goal is 298, please select first number!',
      'answers': [
        {'text': '10', 'score': 10},
        {'text': '13', 'score': 13},
        {'text': '14', 'score': 14},
        {'text': '17', 'score': 17},
        {'text': '16', 'score': 16},
        {'text': '18', 'score': 18}
      ]
    },
    {
      'taskText': 'Your Goal is 298, please select second number!',
      'answers': [
        {'text': '42', 'score': 42},
        {'text': '44', 'score': 44},
        {'text': '40', 'score': 40},
        {'text': '41', 'score': 41},
        {'text': '45', 'score': 45},
        {'text': '49', 'score': 49}
      ]
    },
    {
      'taskText': 'Your Goal is 298, please select third number!',
      'answers': [
        {'text': '142', 'score': 142},
        {'text': '128', 'score': 128},
        {'text': '123', 'score': 123},
        {'text': '124', 'score': 124},
        {'text': '182', 'score': 128},
        {'text': '100', 'score': 100}
      ]
    },
    {
      'taskText': 'Your Goal is 298, please select fourth number!',
      'answers': [
        {'text': '36', 'score': 36},
        {'text': '66', 'score': 66},
        {'text': '61', 'score': 61},
        {'text': '62', 'score': 62},
        {'text': '63', 'score': 63},
        {'text': '68', 'score': 68}
      ]
    },
    {
      'taskText': 'Your Goal is 298, please select fifth number!',
      'answers': [
        {'text': '33', 'score': 33},
        {'text': '23', 'score': 23},
        {'text': '32', 'score': 32},
        {'text': '34', 'score': 34},
        {'text': '31', 'score': 31},
        {'text': '38', 'score': 38}
      ]
    },
    {
      'taskText': 'Your Goal is 298, please select sixth number!',
      'answers': [
        {'text': '70', 'score': 70},
        {'text': '40', 'score': 40},
        {'text': '22', 'score': 22},
        {'text': '19', 'score': 19},
        {'text': '12', 'score': 12},
        {'text': '5', 'score': 5}
      ]
    },
  ];

  var _taskIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _taskIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerOfTask(int score) {
    _totalScore += score;
    setState(() {
      _taskIndex = _taskIndex + 1;
    });
    print(_taskIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink,
        body: _taskIndex < _tasks.length
            ? Quiz(
            answerOfTask: _answerOfTask,
            taskIndex: _taskIndex,
            tasks: _tasks)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
