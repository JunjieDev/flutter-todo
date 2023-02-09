import 'package:flutter/material.dart';

class DeleteSnackbar {
  DeleteSnackbar(BuildContext context){
    const snackBar =  SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
      content: Center(
        child: Text('Delete task'),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
