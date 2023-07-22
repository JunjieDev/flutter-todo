import 'package:flutter/material.dart';
import 'package:flutter_todo/view/todo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: 'Todo App',
    debugShowCheckedModeBanner: false,
    home: Todo(),
  );
}
