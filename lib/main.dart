import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_reminder/models/tasks_data.dart';
import 'screens/task_screen.dart';
import 'themes/theme_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new TaskData(),
      // create: (BuildContext context) {
      //   TaskData();
      // },
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        home: TaskScreen(),
      ),
    );
  }
}
