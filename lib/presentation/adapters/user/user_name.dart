import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/components/icons/initials_avatar.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

final _userByIdProvider = FutureProvider.family<User, String>((ref, userId) {
  return GetUserUsecase(
    userRepository: ref.read(userRepositoryProvider),
  ).execute((id: userId)).map(onResult: (project) => project, onError: (error) => throw error);
});

class UserName extends ConsumerWidget {
  const UserName({required String this.userId, this.iconRadius = 12, super.key}) : user = null;
  const UserName.user({required User this.user, this.iconRadius = 12, super.key}) : userId = null;

  final String? userId;
  final User? user;

  final double iconRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = user != null ? AsyncData(user!) : ref.watch(_userByIdProvider(userId!));

    return userAsync.when(
      loading: () => CircularProgressIndicator(
        strokeWidth: 2,
        constraints: BoxConstraints(
          minHeight: iconRadius,
          maxHeight: iconRadius,
          minWidth: iconRadius,
          maxWidth: iconRadius,
        ),
      ),
      error: (_, _) => const Text('-'),
      data: (user) => Tooltip(
        message: user.mail,
        child: Row(
          spacing: AppSpacing.sm,
          children: [
            InitialsAvatar(initials: user.initials, radius: iconRadius),
            Text(user.fullName),
          ],
        ),
      ),
    );
  }
}
