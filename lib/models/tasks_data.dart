import 'package:flutter/foundation.dart';
import 'package:task_reminder/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'buy milk', description: 'go to the shop and buy milk'),
    Task(title: 'dmart', description: 'go to dmart'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle, String newTaskDescription) {
    final task = Task(title: newTaskTitle, description: newTaskDescription);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
