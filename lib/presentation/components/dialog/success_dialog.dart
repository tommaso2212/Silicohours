import 'package:flutter/material.dart';
import 'package:silicohours/presentation/components/dialog/app_dialog.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({required this.message, this.title, super.key});

  final String? title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        ),
      ],
      child: Text(message),
    );
  }
}
