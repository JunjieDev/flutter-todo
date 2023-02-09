import 'package:flutter/material.dart';

class CancelSnackbar {
  CancelSnackbar(BuildContext context){
    const snackBar =  SnackBar(
      backgroundColor: Colors.grey,
      duration: Duration(seconds: 1),
      content: Center(
        child: Text('Action Cancel'),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
