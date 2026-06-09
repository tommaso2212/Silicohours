import 'package:silicohours/application/usecases/result.dart';

export 'package:silicohours/application/usecases/result.dart';

typedef SuccessHandler<R, I> = Future<void> Function(R result, I input);
typedef ErrorHandler<Exception, I> = Future<void> Function(Exception e, I input);
typedef ValidatorHandler<I> = Future<bool> Function(I input);

abstract class Usecase<R, I> {
  final List<SuccessHandler<R, I>> successHandlers;
  final List<ErrorHandler<Exception, I>> errorHandlers;
  final List<ValidatorHandler<I>> validatorHandlers;

  const Usecase({this.successHandlers = const [], this.errorHandlers = const [], this.validatorHandlers = const []});

  Future<R> call(I input);

  Future<Result<R>> execute(I input) async {
    try {
      for (final v in validatorHandlers) {
        await v(input);
      }
      final result = await call(input);
      for (final s in successHandlers) {
        await s(result, input);
      }
      return Result.result(result);
    } on Exception catch (e) {
      for (final h in errorHandlers) {
        await h(e, input);
      }
      return Result.error(e);
    }
  }
}
