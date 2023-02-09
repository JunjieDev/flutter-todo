import 'package:flutter/material.dart';

class CheckedSnackbar {
  CheckedSnackbar(BuildContext context){
    const snackBar =  SnackBar(
      backgroundColor: Colors.lightGreen,
      duration: Duration(seconds: 1),
      content: Center(
        child: Text('Checked the task'),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
