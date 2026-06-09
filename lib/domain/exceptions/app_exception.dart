import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
sealed class AppException with _$AppException implements Exception {
  const factory AppException.operationAborted() = OperationAbortedException;

  const factory AppException.httpError({required int statusCode, String? title, String? message}) = HttpException;

  const factory AppException.generic({String? title, String? description, Exception? e, StackTrace? str}) =
      GenericException;
}

extension ExceptionFormatter on Exception {
  String? get title => this is AppException
      ? (this as AppException).mapOrNull(httpError: (value) => value.title, generic: (value) => value.title)
      : runtimeType.toString();

  String? get message => this is AppException
      ? (this as AppException).mapOrNull(httpError: (value) => value.message, generic: (value) => value.description)
      : toString();
}
