// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FetchTasksFilter)
final fetchTasksFilterProvider = FetchTasksFilterFamily._();

final class FetchTasksFilterProvider
    extends $NotifierProvider<FetchTasksFilter, String?> {
  FetchTasksFilterProvider._({
    required FetchTasksFilterFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchTasksFilterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchTasksFilterHash();

  @override
  String toString() {
    return r'fetchTasksFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FetchTasksFilter create() => FetchTasksFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTasksFilterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchTasksFilterHash() => r'f286dcaf967ebdf5b572b2dda0b48d98f2e30b3e';

final class FetchTasksFilterFamily extends $Family
    with
        $ClassFamilyOverride<
          FetchTasksFilter,
          String?,
          String?,
          String?,
          String
        > {
  FetchTasksFilterFamily._()
    : super(
        retry: null,
        name: r'fetchTasksFilterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchTasksFilterProvider call(String projectId) =>
      FetchTasksFilterProvider._(argument: projectId, from: this);

  @override
  String toString() => r'fetchTasksFilterProvider';
}

abstract class _$FetchTasksFilter extends $Notifier<String?> {
  late final _$args = ref.$arg as String;
  String get projectId => _$args;

  String? build(String projectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(fetchProject)
final fetchProjectProvider = FetchProjectFamily._();

final class FetchProjectProvider
    extends $FunctionalProvider<AsyncValue<Project>, Project, FutureOr<Project>>
    with $FutureModifier<Project>, $FutureProvider<Project> {
  FetchProjectProvider._({
    required FetchProjectFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchProjectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchProjectHash();

  @override
  String toString() {
    return r'fetchProjectProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Project> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Project> create(Ref ref) {
    final argument = this.argument as String;
    return fetchProject(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProjectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchProjectHash() => r'9430125995db2b3cd2138778c3074dd2f0262449';

final class FetchProjectFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Project>, String> {
  FetchProjectFamily._()
    : super(
        retry: null,
        name: r'fetchProjectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchProjectProvider call(String projectId) =>
      FetchProjectProvider._(argument: projectId, from: this);

  @override
  String toString() => r'fetchProjectProvider';
}

@ProviderFor(fetchProjectTasks)
final fetchProjectTasksProvider = FetchProjectTasksFamily._();

final class FetchProjectTasksProvider
    extends
        $FunctionalProvider<
          Future<List<Task>> Function(int, int),
          Future<List<Task>> Function(int, int),
          Future<List<Task>> Function(int, int)
        >
    with $Provider<Future<List<Task>> Function(int, int)> {
  FetchProjectTasksProvider._({
    required FetchProjectTasksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchProjectTasksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchProjectTasksHash();

  @override
  String toString() {
    return r'fetchProjectTasksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Future<List<Task>> Function(int, int)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Future<List<Task>> Function(int, int) create(Ref ref) {
    final argument = this.argument as String;
    return fetchProjectTasks(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Future<List<Task>> Function(int, int) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Future<List<Task>> Function(int, int)>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProjectTasksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchProjectTasksHash() => r'86d02d5681193246ca2e2a1a4de853819836f163';

final class FetchProjectTasksFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Future<List<Task>> Function(int, int),
          String
        > {
  FetchProjectTasksFamily._()
    : super(
        retry: null,
        name: r'fetchProjectTasksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchProjectTasksProvider call(String projectId) =>
      FetchProjectTasksProvider._(argument: projectId, from: this);

  @override
  String toString() => r'fetchProjectTasksProvider';
}

@ProviderFor(createTaskUsecase)
final createTaskUsecaseProvider = CreateTaskUsecaseProvider._();

final class CreateTaskUsecaseProvider
    extends
        $FunctionalProvider<
          CreateTaskUsecase,
          CreateTaskUsecase,
          CreateTaskUsecase
        >
    with $Provider<CreateTaskUsecase> {
  CreateTaskUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTaskUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTaskUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateTaskUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateTaskUsecase create(Ref ref) {
    return createTaskUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTaskUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateTaskUsecase>(value),
    );
  }
}

String _$createTaskUsecaseHash() => r'2758cdf5a18cd7e435a3bc0b6ec3b67fc3e36630';

@ProviderFor(deleteTaskUsecase)
final deleteTaskUsecaseProvider = DeleteTaskUsecaseProvider._();

final class DeleteTaskUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteTaskUsecase,
          DeleteTaskUsecase,
          DeleteTaskUsecase
        >
    with $Provider<DeleteTaskUsecase> {
  DeleteTaskUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteTaskUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteTaskUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteTaskUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteTaskUsecase create(Ref ref) {
    return deleteTaskUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteTaskUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteTaskUsecase>(value),
    );
  }
}

String _$deleteTaskUsecaseHash() => r'9f022f21b5d9caf065aa024689985213141970ff';
