import 'package:flutter/material.dart';

class UncheckedSnackbar {
  UncheckedSnackbar(BuildContext context){
    const snackBar =  SnackBar(
      backgroundColor: Colors.grey,
      duration: Duration(seconds: 1),
      content: Center(
        child: Text('Unchecked the task'),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
