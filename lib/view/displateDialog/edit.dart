import 'package:flutter/material.dart';
import 'package:flutter_todo/view/snackbar/edit_snackbar.dart';
import 'package:flutter_todo/view/snackbar/cancel_snackbar.dart';

class EditDisplay {
  final Function editTask;
  const EditDisplay({required this.editTask});

  Future<void> editDisplayDialog(BuildContext context, String oldText, int index) async {
    String valueText = oldText;

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Edit Task :\n$oldText')),
        actionsAlignment: MainAxisAlignment.center,
        content: TextFormField(
          onChanged: (value) {
            valueText = value;
          },
          initialValue: oldText, 
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('CONFIRM'),
            onPressed: () {
              if (valueText.isNotEmpty && valueText != oldText){
                EditSnackbar(context);
                editTask(index, valueText);
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
