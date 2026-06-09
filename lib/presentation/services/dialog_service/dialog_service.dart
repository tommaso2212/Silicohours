import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/router/app_router/app_router.dart';

part 'dialog_service.g.dart';

@Riverpod(keepAlive: true)
class DialogService extends _$DialogService {
  late BuildContext? context;

  @override
  void build() {
    context = ref.read(navigatorKeyProvider).currentContext;
  }

  Future<T?> showCustomDialog<T>({required WidgetBuilder builder, bool barrierDismissible = true}) {
    final thisContext = context;
    if (thisContext == null) return Future.value();
    return showDialog<T>(context: thisContext, barrierDismissible: barrierDismissible, builder: builder);
  }
}

extension DialogServiceHelper on DialogService {
  Future<bool> showConfirmDialog({String? title, required String message}) async =>
      await showCustomDialog<bool>(
        builder: (context) => ConfirmDialog(title: title, message: message),
      ) ??
      false;

  Future<void> showSuccessDialog({String? title, required String message}) => showCustomDialog(
    builder: (context) => SuccessDialog(title: title, message: message),
  );

  Future<void> showErrorDialog({String? title, required String message}) => showCustomDialog(
    builder: (context) => ErrorDialog(title: title, message: message),
  );

  Future<void> showExceptionDialog({required Exception exception}) =>
      showCustomDialog(builder: (context) => ErrorDialog.exception(exception: exception));
}

extension DialogHandler on Ref {
  ErrorHandler dialogExceptionHandler() =>
      (e, _) => read(dialogServiceProvider.notifier).showExceptionDialog(exception: e);

  ErrorHandler dialogErrorHandler({String? title, String? message}) =>
      (e, _) => read(
        dialogServiceProvider.notifier,
      ).showErrorDialog(title: title ?? 'Error', message: 'Something went wrong');

  SuccessHandler dialogSuccessHandler({String? title, String? message}) =>
      (_, _) => read(
        dialogServiceProvider.notifier,
      ).showSuccessDialog(title: title ?? 'Success', message: message ?? 'Operation completed with success');

  ValidatorHandler dialogConfirmHandler({String? title, String? message}) =>
      (_) => read(
        dialogServiceProvider.notifier,
      ).showConfirmDialog(title: title ?? 'Confirm', message: message ?? 'Are you sure you want to proceed?');
}
