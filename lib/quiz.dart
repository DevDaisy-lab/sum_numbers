import 'package:flutter/material.dart';

import 'package:sum_numbers/answer.dart';
import 'package:sum_numbers/task.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> tasks;
  final int taskIndex;
  final Function answerOfTask;

  Quiz(
      {@required this.tasks,
      @required this.taskIndex,
      @required this.answerOfTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Task(tasks[taskIndex]['taskText'])),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 2,
                children: [
                  ...(tasks[taskIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return FittedBox(
                      child: SizedBox(
                        height: 40,
                        child: Answer(() => answerOfTask(answer['score']),
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
