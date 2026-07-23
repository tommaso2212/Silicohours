import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  @override
  Future<User?> build() {
    return GetCurrentUserUsecase(
      authRepository: ref.watch(authRepositoryProvider),
    ).execute(()).map(onResult: (result) => result, onError: (_) => null);
  }

  Future<void> login(String userId) async {
    state = const AsyncLoading<User?>();
    final result = await LoginUsecase(authRepository: ref.read(authRepositoryProvider)).execute((userId: userId));
    state = result.on(
      onResult: (user) => AsyncValue<User?>.data(user),
      onError: (e) => AsyncValue<User?>.error(e, StackTrace.current),
    )!;
  }

  Future<void> logout() async {
    await LogoutUsecase(authRepository: ref.read(authRepositoryProvider)).execute(());
    state = const AsyncData(null);
  }
}
