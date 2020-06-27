import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String error;
  const ErrorDialog({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        "Ocorreu um erro",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(error),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Text(
              "Ok",
            ),
          ),
        ),
      ],
    );
  }
}
