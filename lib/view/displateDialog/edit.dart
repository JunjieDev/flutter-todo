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
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Center(child: Text('Edit Task :\n$oldText')),
          actionsAlignment: MainAxisAlignment.center,
          content: TextFormField(
            onChanged: (value) {
              setState(() {
                valueText = value;
              });
            },
            initialValue: oldText, 
          ),
          actions: <Widget>[
            TextButton(
              onPressed: (valueText.isEmpty || valueText == oldText) ? null : () {
                EditSnackbar(context);
                editTask(index, valueText);
                Navigator.pop(context);
              },
              child: const Text('CONFIRM'),
            ),
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                CancelSnackbar(context);
                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
    );
  }
}
