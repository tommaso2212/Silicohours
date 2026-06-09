// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginationController)
final paginationControllerProvider = PaginationControllerFamily._();

final class PaginationControllerProvider
    extends $NotifierProvider<PaginationController, PaginationState<dynamic>> {
  PaginationControllerProvider._({
    required PaginationControllerFamily super.from,
    required (
      Future<List<dynamic>> Function(int pageIndex, int pageSize), {
      int pageSize,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'paginationControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paginationControllerHash();

  @override
  String toString() {
    return r'paginationControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PaginationController create() => PaginationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaginationState<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaginationState<dynamic>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaginationControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginationControllerHash() =>
    r'c2bf8346d45d22bc9f15fd7d842026b9148d9c0e';

final class PaginationControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginationController,
          PaginationState<dynamic>,
          PaginationState<dynamic>,
          PaginationState<dynamic>,
          (
            Future<List<dynamic>> Function(int pageIndex, int pageSize), {
            int pageSize,
          })
        > {
  PaginationControllerFamily._()
    : super(
        retry: null,
        name: r'paginationControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaginationControllerProvider call(
    Future<List<dynamic>> Function(int pageIndex, int pageSize) fetchItems, {
    int pageSize = 20,
  }) => PaginationControllerProvider._(
    argument: (fetchItems, pageSize: pageSize),
    from: this,
  );

  @override
  String toString() => r'paginationControllerProvider';
}

abstract class _$PaginationController
    extends $Notifier<PaginationState<dynamic>> {
  late final _$args =
      ref.$arg
          as (
            Future<List<dynamic>> Function(int pageIndex, int pageSize), {
            int pageSize,
          });
  Future<List<dynamic>> Function(int pageIndex, int pageSize) get fetchItems =>
      _$args.$1;
  int get pageSize => _$args.pageSize;

  PaginationState<dynamic> build(
    Future<List<dynamic>> Function(int pageIndex, int pageSize) fetchItems, {
    int pageSize = 20,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<PaginationState<dynamic>, PaginationState<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaginationState<dynamic>, PaginationState<dynamic>>,
              PaginationState<dynamic>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(_$args.$1, pageSize: _$args.pageSize),
    );
  }
}
