import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String text;
  Todo({required this.text}) : this.id = Uuid().v4();
}

class ListToDo extends ValueNotifier<List<Todo>> {
  List<Todo> todoList = [];
  ListToDo._sharedListGlobal() : super([]);
  static ListToDo listToDo = ListToDo._sharedListGlobal();
  factory ListToDo() => listToDo;

  void remove({required Todo todo}) {
    todoList.remove(todo);
    notifyListeners();
  }

  void add({required Todo todo}) {
    todoList.add(todo);
    print('add');
    notifyListeners();
  }
}

class ChapterTwoTodoList extends StatelessWidget {
  const ChapterTwoTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: ListToDo.listToDo,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Dismissible(
                onDismissed: (derection) {
                  ListToDo().remove(todo: value[index]);
                },
                key: ValueKey(value[index].id),
                child: Material(
                  elevation: 6.0,
                  child: ListTile(
                    title: Text(value[index].text),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => newTodoView(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class newTodoView extends StatefulWidget {
  const newTodoView({super.key});

  @override
  State<newTodoView> createState() => _newTodoViewState();
}

class _newTodoViewState extends State<newTodoView> {
  late final TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new contact'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter new text right here...',
            ),
          ),
          TextButton(
              onPressed: () {
                ListToDo.listToDo
                    .add(todo: Todo(text: textEditingController.text));
                Navigator.of(context).pop();
              },
              child: Text('Add Contact'))
        ],
      ),
    );
  }
}
