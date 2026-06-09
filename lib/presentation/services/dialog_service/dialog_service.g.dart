// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DialogService)
final dialogServiceProvider = DialogServiceProvider._();

final class DialogServiceProvider
    extends $NotifierProvider<DialogService, void> {
  DialogServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dialogServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dialogServiceHash();

  @$internal
  @override
  DialogService create() => DialogService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dialogServiceHash() => r'f7870d667c084860306f3c3d72665680624c2af5';

abstract class _$DialogService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
