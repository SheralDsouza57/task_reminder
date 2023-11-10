import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  final String taskTitle;
  final String taskDescription;
  final ValueChanged<bool?>? checkboxCallback;
  final void Function() longPressCallback;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.taskDescription,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longPressCallback,
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
