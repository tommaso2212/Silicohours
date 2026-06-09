import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/services/repositories/user_repository.dart';
import 'package:silicohours/infrastructure/repositories/user/mock_user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return MockUserRepository();
});
