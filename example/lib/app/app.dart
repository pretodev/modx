import 'package:flutter/material.dart';
import 'package:modx/modx.dart';

import '../pages/about_page.dart';
import '../pages/todo_list_page.dart';

class MyApp extends ModxApp<AppController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget get appWidget => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      );

  @override
  List<ModxPage> get pages => [
        TodoListPage(),
        AboutPage(),
      ];

  @override
  void binding(i) {
    bind(AppController());
  }
}

class AppController extends ModxController {
  @override
  void onInit() {
    super.onInit();
    print('Application Started');
  }
}
