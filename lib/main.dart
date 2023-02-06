import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  Widget build(BuildContext context) => MaterialApp(
    title: 'Todo App',
    debugShowCheckedModeBanner: false,
    home: Scaffold(
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
        onPressed: () => addTask("Item new Task ${tasks.length}"),
        child: const Icon(Icons.add),
      ),
    ),
  );
}


