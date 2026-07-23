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
    r'8e947da80160ea4bd84843b9d9626fa123327fc6';

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
    r'66c5b20b812f66bb76a15de2ea7ea425a5c6cf15';

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
    r'1b6e98f1387484368ff95f0c633bead5b62a96a8';
