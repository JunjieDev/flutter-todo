import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: 'Todo App',
    debugShowCheckedModeBanner: false,
    home: TodoWidget(),
  );
}

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  final List<Task> tasks = [];

  void addTask(String text){
    setState(() {
      tasks.add(Task(checked: false, text: text));
    });
  }

  void deleteTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(int index, String newText){
    setState(() {
      tasks[index].text = newText;
    });
  }

  Future<void> _addDisplayDialog(BuildContext context) async {
    String valueText = "";

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(child: Text('New Task')),
        actionsAlignment: MainAxisAlignment.center,
        content: TextField(
          onChanged: (value) {
            valueText = value;
          },
          decoration: const InputDecoration(
            hintText: "New Task",
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('CONFIRM'),
            onPressed: () {
              if (valueText.isNotEmpty){
                addTask(valueText);
                Navigator.pop(context);
              }
            },
          ),
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Todo App'),
      centerTitle: true,
    ),
    body: ListView.builder(
      itemCount: tasks.length,
      itemBuilder:(context, index) {
        return Dismissible(
          background: Container(
            color: Colors.yellow,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.edit),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.delete),
          ),
          key: ValueKey<String>(tasks[index].text),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              editTask(index, "Item Editing");
            }
            else if (direction == DismissDirection.endToStart){
              deleteTask(index);
            }
          },
          child: ListTile(
            leading: Checkbox(
              value: tasks[index].checked, 
              tristate: true,
              onChanged: (e) {
                setState(() {
                  tasks[index].check();
                });
              },
              activeColor: Colors.green,
              checkColor: Colors.white,
            ),
            title: Text(
              tasks[index].text,
              style: TextStyle(
                color: tasks[index].checked ? Colors.grey : Colors.black,
                decoration: tasks[index].checked ? TextDecoration.lineThrough : TextDecoration.none
              ),
            ),
          ),
        );
      }
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => _addDisplayDialog(context),
      child: const Icon(Icons.add),
    ),
  );
}
