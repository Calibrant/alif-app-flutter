import 'package:flutter/material.dart';
import 'package:flutter_app_alif/provider/todos.dart';
import 'package:flutter_app_alif/screen/todo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        home: ToDoScreen(),
      ),
    );
  }
}
