import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/dialog/app_dialog.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({required String this.message, this.title, super.key}) : exception = null;
  const ErrorDialog.exception({required Exception this.exception, super.key}) : title = null, message = null;

  final String? title;
  final String? message;

  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    final errorMessage = message ?? exception?.message;
    return AppDialog(
      title: title ?? exception?.title,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        ),
      ],
      child: errorMessage != null ? Text(errorMessage) : const SizedBox.shrink(),
    );
  }
}
