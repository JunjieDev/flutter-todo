import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/view/search.dart';
import 'package:flutter_todo/view/displateDialog/add.dart';
import 'package:flutter_todo/view/displateDialog/edit.dart';
import 'package:flutter_todo/view/snackbar/delete_snackbar.dart';
import 'package:flutter_todo/view/snackbar/checked_snackbar.dart';
import 'package:flutter_todo/view/snackbar/unchecked_snackbar.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List<Task> tasks = [];
  bool _search = false;

  void searchChange() {
    setState(() {
      _search = ! _search;
    });
  }

  int getPrimiryKey(){
    sortTasks();
    if(tasks.isNotEmpty){
      return tasks.last.id + 1;
    }
    return 1;
  }

  void addTask(String text){
    setState(() {
      tasks.add(Task(id: getPrimiryKey(), checked: false, text: text));
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

  void sortTasks() {
    setState(() {
      tasks.sort((a, b) => a.id.compareTo(b.id));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Todo App'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            searchChange();
          },
        )
      ],
    ),
    body: Column(
      children: <Widget>[
        Visibility(
          visible: _search,
          child: const Search()
        ),
        Expanded(
          child: ListView.builder(
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
                key: UniqueKey(),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    EditDisplay(editTask: editTask, sortTasks: sortTasks).editDisplayDialog(context, tasks[index].text, index);
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
                        tasks[index].check();
                        tasks[index].checked ? CheckedSnackbar(context) : UncheckedSnackbar(context);
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
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => AddDisplay(addTask: addTask).addDisplayDialog(context),
      child: const Icon(Icons.add),
    ),
  );
}
