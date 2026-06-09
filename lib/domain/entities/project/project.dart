import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    required String id,
    required String name,
    required double hourPrice,
  }) = _Project;
}
