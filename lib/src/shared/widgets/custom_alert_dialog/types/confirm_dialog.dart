import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final String option1;
  final String option2;
  final Function onOption1;
  final Function onOption2;
  final TextStyle option1Style;
  final TextStyle option2Style;

  ConfirmDialog({
    @required this.title,
    @required this.content,
    @required this.option1,
    @required this.option2,
    @required this.onOption1,
    @required this.onOption2,
    @required this.option1Style,
    @required this.option2Style,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: content,
      actions: [
        FlatButton(
          onPressed: () {
            onOption1();
            Navigator.of(context).pop();
          },
          child: Container(
            child: Text(
              option1,
              style: option1Style,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            onOption2();
            Navigator.of(context).pop();
          },
          child: Container(
            child: Text(
              option2,
              style: option2Style,
            ),
          ),
        ),
      ],
    );
  }
}
