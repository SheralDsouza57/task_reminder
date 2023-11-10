import 'package:flutter/material.dart';
import 'package:task_reminder/models/tasks_data.dart';
import 'package:task_reminder/widgets/tasks_list.dart';
import 'package:task_reminder/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(Icons.list,
                      size: 30,
                      color: Theme.of(context).appBarTheme.backgroundColor
                      // color: Colors.indigo,
                      ),
                  // backgroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 30,
                ),
                SizedBox(height: 20),
                Text(
                  'Task Reminder',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      // color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks left',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18),
                  // style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                // color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 15, bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),
            );

            print('pressed');
          },
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          // backgroundColor: Colors.indigo,
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
