import 'package:flutter/material.dart';
import 'package:silicohours/presentation/components/dialog/app_dialog.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({required this.message, this.title, super.key});

  final String? title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        ),
      ],
      child: Text(message),
    );
  }
}
