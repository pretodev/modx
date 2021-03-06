import 'package:flutter/material.dart';
import 'package:modx/modx.dart';

class TodoListPage extends ModxPage {
  @override
  String get route => initialRoute;

  @override
  Widget get view => const TodoListView();

  @override
  void binding(i) {
    bind(TodoListStore());
    bind(TodoListController());
  }
}

class TodoListStore {
  Rx<List<String>> obj = Rx<List<String>>([
    'Fazer almoco',
    'Estudar Flutter',
    'Estudar Dart',
  ]);
}

class TodoListController extends ModxController<TodoListStore> {
  void showAbout() {
    view.toNamed("/about");
  }
}

class TodoListView extends ModxView<TodoListController, TodoListStore> {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: controller.showAbout,
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: store.obj.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(store.obj.value[index]),
            );
          },
        ),
      ),
    );
  }
}
