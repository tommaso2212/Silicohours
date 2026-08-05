import 'package:silicohours/application/services/repositories/auth_repository.dart';
import 'package:silicohours/application/services/repositories/user_repository.dart';
import 'package:silicohours/domain/domain.dart';

class MockAuthRepository implements AuthRepository {
  MockAuthRepository({required this._userRepository});

  final UserRepository _userRepository;

  User? _currentUser;

  @override
  Future<User?> getCurrentUser() async => _currentUser;

  @override
  Future<User> login(String userId) async {
    final user = await _userRepository.getUser(userId);
    _currentUser = user;
    return user;
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
  }
}
