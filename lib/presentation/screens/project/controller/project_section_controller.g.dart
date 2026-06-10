// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_section_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FetchProjectsFilter)
final fetchProjectsFilterProvider = FetchProjectsFilterProvider._();

final class FetchProjectsFilterProvider
    extends $NotifierProvider<FetchProjectsFilter, String?> {
  FetchProjectsFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchProjectsFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchProjectsFilterHash();

  @$internal
  @override
  FetchProjectsFilter create() => FetchProjectsFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$fetchProjectsFilterHash() =>
    r'956013f40e2db47a64325f6c30efdd6ed9ef5a9b';

abstract class _$FetchProjectsFilter extends $Notifier<String?> {
  String? build();
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
    element.handleCreate(ref, build);
  }
}

@ProviderFor(fetchProjects)
final fetchProjectsProvider = FetchProjectsProvider._();

final class FetchProjectsProvider
    extends
        $FunctionalProvider<
          Future<List<Project>> Function(int, int),
          Future<List<Project>> Function(int, int),
          Future<List<Project>> Function(int, int)
        >
    with $Provider<Future<List<Project>> Function(int, int)> {
  FetchProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchProjectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchProjectsHash();

  @$internal
  @override
  $ProviderElement<Future<List<Project>> Function(int, int)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Future<List<Project>> Function(int, int) create(Ref ref) {
    return fetchProjects(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Future<List<Project>> Function(int, int) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Future<List<Project>> Function(int, int)>(value),
    );
  }
}

String _$fetchProjectsHash() => r'ff07c1f1264221256be34cb32c2ca40b202dbc4f';

@ProviderFor(deleteProjectUsecase)
final deleteProjectUsecaseProvider = DeleteProjectUsecaseProvider._();

final class DeleteProjectUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteProjectUsecase,
          DeleteProjectUsecase,
          DeleteProjectUsecase
        >
    with $Provider<DeleteProjectUsecase> {
  DeleteProjectUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteProjectUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteProjectUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteProjectUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteProjectUsecase create(Ref ref) {
    return deleteProjectUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteProjectUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteProjectUsecase>(value),
    );
  }
}

String _$deleteProjectUsecaseHash() =>
    r'91f18c20db024d02f2a12a33d446052d6d4cd6dc';

@ProviderFor(updateProjectUsecase)
final updateProjectUsecaseProvider = UpdateProjectUsecaseProvider._();

final class UpdateProjectUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateProjectUsecase,
          UpdateProjectUsecase,
          UpdateProjectUsecase
        >
    with $Provider<UpdateProjectUsecase> {
  UpdateProjectUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateProjectUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateProjectUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateProjectUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateProjectUsecase create(Ref ref) {
    return updateProjectUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateProjectUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateProjectUsecase>(value),
    );
  }
}

String _$updateProjectUsecaseHash() =>
    r'dcf8fff0078d81953d94781ac18ddaeab9df4f70';

@ProviderFor(createProjectUsecase)
final createProjectUsecaseProvider = CreateProjectUsecaseProvider._();

final class CreateProjectUsecaseProvider
    extends
        $FunctionalProvider<
          CreateProjectUsecase,
          CreateProjectUsecase,
          CreateProjectUsecase
        >
    with $Provider<CreateProjectUsecase> {
  CreateProjectUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createProjectUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createProjectUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateProjectUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateProjectUsecase create(Ref ref) {
    return createProjectUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateProjectUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateProjectUsecase>(value),
    );
  }
}

String _$createProjectUsecaseHash() =>
    r'5695f3a17babc9c9085f934a34cdf779617af195';
