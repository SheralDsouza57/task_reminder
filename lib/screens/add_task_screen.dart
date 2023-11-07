import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  // const AddTaskScreen({Key? key}) : super(key: key);

  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    TimeOfDay timeOfDay = TimeOfDay.now();
    DateTime selected = DateTime.now();
    String? newTaskTitle;
    String? newTaskDescription;
    return Container(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white,
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
                  color: Colors.indigo,
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
                    color: Colors.indigo,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showTimePicker(context: context, initialTime: timeOfDay);
                  },
                  child: Icon(
                    Icons.timer,
                    color: Colors.indigo,
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
                    MaterialStateProperty.all<Color>(Colors.indigo),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                addTaskCallback(newTaskTitle, newTaskDescription);

                // print(newTaskTitle);
                // print(newTaskDescription);
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
