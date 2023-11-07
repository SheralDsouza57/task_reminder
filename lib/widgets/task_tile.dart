import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  final String taskTitle;
  final String taskDescription;
  final ValueChanged<bool?>? checkboxCallback;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.taskDescription,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(
          taskDescription,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.indigo,
          onChanged: checkboxCallback,
        ));
  }
}
