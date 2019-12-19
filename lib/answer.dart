import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectAnswer;
  final String answerText;

  Answer(this.selectAnswer, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
      child: RaisedButton(
        color: Colors.green[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textColor: Colors.pink,
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: selectAnswer,
      ),
    );
  }
}
