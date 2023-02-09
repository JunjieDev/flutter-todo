import 'package:flutter/material.dart';

class AddSnackbar {
  AddSnackbar(BuildContext context){
    const snackBar =  SnackBar(
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
      content: Center(
        child: Text('Add new Task'),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
