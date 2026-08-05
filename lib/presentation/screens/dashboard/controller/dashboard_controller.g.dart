// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchHoursLoggedToday)
final fetchHoursLoggedTodayProvider = FetchHoursLoggedTodayProvider._();

final class FetchHoursLoggedTodayProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  FetchHoursLoggedTodayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHoursLoggedTodayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHoursLoggedTodayHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return fetchHoursLoggedToday(ref);
  }
}

String _$fetchHoursLoggedTodayHash() =>
    r'5e8d2c3fa8b6da7d8f9d2b5a9006bb049fe6fab6';

@ProviderFor(fetchHoursLoggedThisWeek)
final fetchHoursLoggedThisWeekProvider = FetchHoursLoggedThisWeekProvider._();

final class FetchHoursLoggedThisWeekProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  FetchHoursLoggedThisWeekProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHoursLoggedThisWeekProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHoursLoggedThisWeekHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return fetchHoursLoggedThisWeek(ref);
  }
}

String _$fetchHoursLoggedThisWeekHash() =>
    r'a06b0e33d0f7c597418359ab3d7957f385569696';

@ProviderFor(fetchHoursLoggedCurrentMonth)
final fetchHoursLoggedCurrentMonthProvider =
    FetchHoursLoggedCurrentMonthProvider._();

final class FetchHoursLoggedCurrentMonthProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  FetchHoursLoggedCurrentMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHoursLoggedCurrentMonthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHoursLoggedCurrentMonthHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return fetchHoursLoggedCurrentMonth(ref);
  }
}

String _$fetchHoursLoggedCurrentMonthHash() =>
    r'd7073b26f9227dec8d9a432a720a193066a50826';

@ProviderFor(fetchHoursLoggedLastWeek)
final fetchHoursLoggedLastWeekProvider = FetchHoursLoggedLastWeekProvider._();

final class FetchHoursLoggedLastWeekProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<DateTime, double>>,
          Map<DateTime, double>,
          FutureOr<Map<DateTime, double>>
        >
    with
        $FutureModifier<Map<DateTime, double>>,
        $FutureProvider<Map<DateTime, double>> {
  FetchHoursLoggedLastWeekProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHoursLoggedLastWeekProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHoursLoggedLastWeekHash();

  @$internal
  @override
  $FutureProviderElement<Map<DateTime, double>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<DateTime, double>> create(Ref ref) {
    return fetchHoursLoggedLastWeek(ref);
  }
}

String _$fetchHoursLoggedLastWeekHash() =>
    r'ffcb914ffbbc3cadf3ad32a20844a9c9a63a0766';

@ProviderFor(fetchHoursLoggedLastWeekByProject)
final fetchHoursLoggedLastWeekByProjectProvider =
    FetchHoursLoggedLastWeekByProjectProvider._();

final class FetchHoursLoggedLastWeekByProjectProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProjectHours>>,
          List<ProjectHours>,
          FutureOr<List<ProjectHours>>
        >
    with
        $FutureModifier<List<ProjectHours>>,
        $FutureProvider<List<ProjectHours>> {
  FetchHoursLoggedLastWeekByProjectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHoursLoggedLastWeekByProjectProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$fetchHoursLoggedLastWeekByProjectHash();

  @$internal
  @override
  $FutureProviderElement<List<ProjectHours>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProjectHours>> create(Ref ref) {
    return fetchHoursLoggedLastWeekByProject(ref);
  }
}

String _$fetchHoursLoggedLastWeekByProjectHash() =>
    r'465e1215ca61dd4af34e1ed304262b31239da471';

@ProviderFor(fetchHoursLoggedCurrentWeekByProject)
final fetchHoursLoggedCurrentWeekByProjectProvider =
    FetchHoursLoggedCurrentWeekByProjectProvider._();

final class FetchHoursLoggedCurrentWeekByProjectProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProjectWeekHours>>,
          List<ProjectWeekHours>,
          FutureOr<List<ProjectWeekHours>>
        >
    with
        $FutureModifier<List<ProjectWeekHours>>,
        $FutureProvider<List<ProjectWeekHours>> {
  FetchHoursLoggedCurrentWeekByProjectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHoursLoggedCurrentWeekByProjectProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$fetchHoursLoggedCurrentWeekByProjectHash();

  @$internal
  @override
  $FutureProviderElement<List<ProjectWeekHours>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProjectWeekHours>> create(Ref ref) {
    return fetchHoursLoggedCurrentWeekByProject(ref);
  }
}

String _$fetchHoursLoggedCurrentWeekByProjectHash() =>
    r'71fc99da273c3cdaa0a3ee7479cf6b9774dc5852';

@ProviderFor(fetchHoursLoggedCurrentMonthByProject)
final fetchHoursLoggedCurrentMonthByProjectProvider =
    FetchHoursLoggedCurrentMonthByProjectProvider._();

final class FetchHoursLoggedCurrentMonthByProjectProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProjectHours>>,
          List<ProjectHours>,
          FutureOr<List<ProjectHours>>
        >
    with
        $FutureModifier<List<ProjectHours>>,
        $FutureProvider<List<ProjectHours>> {
  FetchHoursLoggedCurrentMonthByProjectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHoursLoggedCurrentMonthByProjectProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$fetchHoursLoggedCurrentMonthByProjectHash();

  @$internal
  @override
  $FutureProviderElement<List<ProjectHours>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProjectHours>> create(Ref ref) {
    return fetchHoursLoggedCurrentMonthByProject(ref);
  }
}

String _$fetchHoursLoggedCurrentMonthByProjectHash() =>
    r'e254ed7c8f2ec659f3d02c9f226a336edcf32b16';
