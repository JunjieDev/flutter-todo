import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/view/displateDialog/add.dart';
import 'package:flutter_todo/view/displateDialog/edit.dart';
import 'package:flutter_todo/view/snackbar/delete_snackbar.dart';
import 'package:flutter_todo/view/snackbar/checked_snackbar.dart';
import 'package:flutter_todo/view/snackbar/edit_snackbar.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
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
          key: Key(index.toString()),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              EditDisplay(editTask: editTask).editDisplayDialog(context, tasks[index].text, index);
            }
            else if (direction == DismissDirection.endToStart){
              deleteTask(index);
              DeleteSnackbar(context);
            }
          },
          child: ListTile(
            leading: Checkbox(
              value: tasks[index].checked, 
              tristate: true,
              onChanged: (e) {
                setState(() {
                  EditSnackbar(context);
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
      onPressed: () => AddDisplay(addTask: addTask).addDisplayDialog(context),
      child: const Icon(Icons.add),
    ),
  );
}
