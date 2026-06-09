import 'package:silicohours/domain/domain.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers({int? pageIndex, int? pageSize, String? q});
  Future<User> getUser(String id);
  Future<void> deleteUser(String id);
  Future<void> editUserRole(String id, Role role);
}
