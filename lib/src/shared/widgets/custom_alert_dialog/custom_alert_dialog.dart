import 'package:flutter/material.dart';
import 'types/confirm_dialog.dart';
import 'types/error_dialog.dart';

class CustomAlertDialog {
  static Future<void> confirmDialog(
    BuildContext context, {
    String title,
    Widget content,
    String option1,
    String option2,
    Function onOption1,
    Function onOption2,
    TextStyle option1Style,
    TextStyle option2Style,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: title,
        content: content,
        option1: option1,
        option2: option2,
        onOption1: onOption1,
        onOption2: onOption2,
        option1Style: option1Style,
        option2Style: option2Style,
      ),
    );
  }

  static Future<void> error(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder: (context) => ErrorDialog(error: error),
    );
  }
}
