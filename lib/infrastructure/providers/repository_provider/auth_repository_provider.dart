import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/services/repositories/auth_repository.dart';
import 'package:silicohours/infrastructure/providers/repository_provider/user_repository_provider.dart';
import 'package:silicohours/infrastructure/repositories/auth/mock_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthRepository(userRepository: ref.watch(userRepositoryProvider));
});
