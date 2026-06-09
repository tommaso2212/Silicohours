extension type Result<R>._(({R? result, Exception? error}) _) {
  Result.result(R result) : this._((result: result, error: null));
  Result.error(Exception error) : this._((result: null, error: error));

  T? on<T>({T Function(R result)? onResult, void Function(Exception error)? onError}) {
    if (_.result != null) return onResult?.call(_.result as R);
    if (_.error != null) onError?.call(_.error!);
    return null;
  }
}

extension FutureResult on Future<Result> {
  Future<R> map<R>({required R Function(R result) onResult, required R Function(Exception error) onError}) =>
      then((value) => value.on<R>(onResult: (result) => onResult(result as R), onError: onError)!);

  Future<R?> mapOrNull<R>({R Function(R result)? onResult, R Function(Exception error)? onError}) => then(
    (value) =>
        value.on<R>(onResult: onResult != null ? (result) => onResult.call(result as R) : null, onError: onError),
  );
}
