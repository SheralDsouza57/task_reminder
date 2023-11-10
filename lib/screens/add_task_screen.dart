import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_reminder/models/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  // const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay timeOfDay = TimeOfDay.now();
    DateTime selected = DateTime.now();
    String newTaskTitle = '';
    String newTaskDescription = '';
    return Container(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            // color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  // color: Colors.indigo
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskDescription = newText;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: selected,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101));
                  },
                  child: Icon(
                    Icons.date_range,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    // color: Colors.indigo,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showTimePicker(context: context, initialTime: timeOfDay);
                  },
                  child: Icon(
                    Icons.timer,
                    color: Theme.of(context).appBarTheme.backgroundColor,

                    // color: Colors.indigo,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    // MaterialStateProperty.all<Color>(Colors.indigo),
                    MaterialStateProperty.all<Color>(
                        Theme.of(context).appBarTheme.backgroundColor!),
                // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
              ),
              onPressed: () {
                // print(newTaskTitle);
                // print(newTaskDescription);
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle, newTaskDescription);
                Navigator.pop(context);
              },
              child: Text('Add'),
            )
          ],
        ),
      ),
      color: Color(0xff757575),
    );
  }
}
