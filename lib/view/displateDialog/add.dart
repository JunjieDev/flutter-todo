import 'package:flutter/material.dart';
import 'package:flutter_todo/view/snackbar/add_snackbar.dart';
import 'package:flutter_todo/view/snackbar/cancel_snackbar.dart';

class AddDisplay {
  final Function addTask;
  const AddDisplay({required this.addTask});

  Future<void> addDisplayDialog(BuildContext context) async {
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
                AddSnackbar(context);
                addTask(valueText);
                Navigator.pop(context);
              }
            },
          ),
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              CancelSnackbar(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
