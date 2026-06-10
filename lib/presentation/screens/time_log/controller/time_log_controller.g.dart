// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_log_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchTimeLogs)
final fetchTimeLogsProvider = FetchTimeLogsProvider._();

final class FetchTimeLogsProvider
    extends
        $FunctionalProvider<
          Future<List<TimeLog>> Function(int, int),
          Future<List<TimeLog>> Function(int, int),
          Future<List<TimeLog>> Function(int, int)
        >
    with $Provider<Future<List<TimeLog>> Function(int, int)> {
  FetchTimeLogsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchTimeLogsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchTimeLogsHash();

  @$internal
  @override
  $ProviderElement<Future<List<TimeLog>> Function(int, int)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Future<List<TimeLog>> Function(int, int) create(Ref ref) {
    return fetchTimeLogs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Future<List<TimeLog>> Function(int, int) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Future<List<TimeLog>> Function(int, int)>(value),
    );
  }
}

String _$fetchTimeLogsHash() => r'c749c2f5a194428986c6e31adb98d3e6fd9f709a';

@ProviderFor(createTimeLogUsecase)
final createTimeLogUsecaseProvider = CreateTimeLogUsecaseProvider._();

final class CreateTimeLogUsecaseProvider
    extends
        $FunctionalProvider<
          CreateTimeLogUsecase,
          CreateTimeLogUsecase,
          CreateTimeLogUsecase
        >
    with $Provider<CreateTimeLogUsecase> {
  CreateTimeLogUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTimeLogUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTimeLogUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateTimeLogUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateTimeLogUsecase create(Ref ref) {
    return createTimeLogUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTimeLogUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateTimeLogUsecase>(value),
    );
  }
}

String _$createTimeLogUsecaseHash() =>
    r'd219663dfe9ec7768d61cea06607dcf5b3668e15';

@ProviderFor(deleteTimeLogUsecase)
final deleteTimeLogUsecaseProvider = DeleteTimeLogUsecaseProvider._();

final class DeleteTimeLogUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteTimeLogUsecase,
          DeleteTimeLogUsecase,
          DeleteTimeLogUsecase
        >
    with $Provider<DeleteTimeLogUsecase> {
  DeleteTimeLogUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteTimeLogUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteTimeLogUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteTimeLogUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteTimeLogUsecase create(Ref ref) {
    return deleteTimeLogUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteTimeLogUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteTimeLogUsecase>(value),
    );
  }
}

String _$deleteTimeLogUsecaseHash() =>
    r'5e80b67b5be6b639930bf36ec675892266de33a8';
