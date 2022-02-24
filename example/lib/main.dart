import 'package:example/pages/about_page.dart';
import 'package:example/pages/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:modx/modx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ).modularize(
      initialRoute: initialRoute,
      pages: [
        TodoListPage(),
        AboutPage(),
      ],
    );
  }
}
