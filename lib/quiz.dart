import 'package:flutter/material.dart';

import 'package:sum_numbers/answer.dart';
import 'package:sum_numbers/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Question(questions[questionIndex]['questionText'])),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 2,
                children: [
                  ...(questions[questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return FittedBox(
                      child: SizedBox(
                        height: 40,
                        child: Answer(() => answerQuestion(answer['score']),
                            answer['text']),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
