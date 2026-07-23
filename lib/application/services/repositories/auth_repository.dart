import 'package:silicohours/domain/domain.dart';

abstract class AuthRepository {
  Future<User?> getCurrentUser();
  Future<User> login(String userId);
  Future<void> logout();
}
