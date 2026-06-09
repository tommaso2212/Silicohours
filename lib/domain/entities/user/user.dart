import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum Role { admin, user }

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    String? firstName,
    String? lastName,
    String? mail,
    @Default(Role.user) Role role,
  }) = _User;
}

extension UserExtension on User {
  String? get fullName => [firstName, lastName].where((element) => element != null).join(' ');

  String get initials {
    final first = firstName?.isNotEmpty == true ? firstName![0] : '';
    final last = lastName?.isNotEmpty == true ? lastName![0] : '';
    return '$first$last'.toUpperCase();
  }
}
