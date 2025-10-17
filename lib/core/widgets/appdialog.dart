import 'package:flutter/material.dart';

class Appdialog {
  static void ShowMessage(
    BuildContext context, {
    required String title,
    MessageType type = MessageType.success,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: type == MessageType.success
            ? Colors.green
            : Colors.red,
        content: Text(title),
      ),
    );
  }
}

enum MessageType { success, error }
