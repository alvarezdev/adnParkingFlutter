import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {

  const AlertDialogWidget._({
    required this.title,
    required this.description,
    required this.actions,
  });

  final String title;
  final String description;
  final List<Widget>? actions;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: actions,
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required List<Widget>? actions,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogWidget._(
          title: title,
          description: description,
          actions: actions,
        );
      },
    );
  }
}
