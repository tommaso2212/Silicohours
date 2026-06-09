import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({required this.child, this.title, this.actions, super.key});

  final String? title;
  final Widget child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: title?.isNotEmpty ?? false ? Text(title!) : null, content: child, actions: actions);
  }
}
