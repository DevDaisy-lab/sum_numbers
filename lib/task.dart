import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  String taskText;

  Task(this.taskText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, top: 24, right: 10, bottom: 0),
          child: Image.asset(
            'assets/images/pic1.jpg',
            width: double.infinity,
            height: 237,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Text(
            taskText,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
