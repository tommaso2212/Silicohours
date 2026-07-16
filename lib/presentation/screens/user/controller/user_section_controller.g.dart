// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_section_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FetchUsersFilter)
final fetchUsersFilterProvider = FetchUsersFilterProvider._();

final class FetchUsersFilterProvider
    extends $NotifierProvider<FetchUsersFilter, String?> {
  FetchUsersFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUsersFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUsersFilterHash();

  @$internal
  @override
  FetchUsersFilter create() => FetchUsersFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$fetchUsersFilterHash() => r'720443105f6b08185139ac74c1876ccf0daefcc1';

abstract class _$FetchUsersFilter extends $Notifier<String?> {
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

@ProviderFor(fetchUsers)
final fetchUsersProvider = FetchUsersProvider._();

final class FetchUsersProvider
    extends
        $FunctionalProvider<
          Future<List<User>> Function(int, int),
          Future<List<User>> Function(int, int),
          Future<List<User>> Function(int, int)
        >
    with $Provider<Future<List<User>> Function(int, int)> {
  FetchUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUsersHash();

  @$internal
  @override
  $ProviderElement<Future<List<User>> Function(int, int)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Future<List<User>> Function(int, int) create(Ref ref) {
    return fetchUsers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Future<List<User>> Function(int, int) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Future<List<User>> Function(int, int)>(value),
    );
  }
}

String _$fetchUsersHash() => r'acd6fdc022d33de7de8dfb900695cc4cc16669bc';

@ProviderFor(deleteUserUsecase)
final deleteUserUsecaseProvider = DeleteUserUsecaseProvider._();

final class DeleteUserUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteUserUsecase,
          DeleteUserUsecase,
          DeleteUserUsecase
        >
    with $Provider<DeleteUserUsecase> {
  DeleteUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteUserUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteUserUsecase create(Ref ref) {
    return deleteUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteUserUsecase>(value),
    );
  }
}

String _$deleteUserUsecaseHash() => r'b993e6de9a60c7199d85458420cc66a14f1a74d9';

@ProviderFor(editUserRoleUsecase)
final editUserRoleUsecaseProvider = EditUserRoleUsecaseProvider._();

final class EditUserRoleUsecaseProvider
    extends
        $FunctionalProvider<
          EditUserRoleUsecase,
          EditUserRoleUsecase,
          EditUserRoleUsecase
        >
    with $Provider<EditUserRoleUsecase> {
  EditUserRoleUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editUserRoleUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editUserRoleUsecaseHash();

  @$internal
  @override
  $ProviderElement<EditUserRoleUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EditUserRoleUsecase create(Ref ref) {
    return editUserRoleUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditUserRoleUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditUserRoleUsecase>(value),
    );
  }
}

String _$editUserRoleUsecaseHash() =>
    r'5dcd759f79528350940da9b38ba3f072cac89f7f';
