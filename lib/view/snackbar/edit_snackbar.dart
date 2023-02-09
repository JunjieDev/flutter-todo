import 'package:flutter/material.dart';

class EditSnackbar {
  EditSnackbar(BuildContext context){
    const snackBar =  SnackBar(
      backgroundColor: Colors.yellow ,
      duration: Duration(seconds: 1),
      content: Center(
        child: Text('Edit the task'),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
