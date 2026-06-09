import 'package:silicohours/application/services/repositories/user_repository.dart';
import 'package:silicohours/domain/domain.dart';

class MockUserRepository implements UserRepository {
  final List<User> _users = [
    const User(id: '1', firstName: 'Alice', lastName: 'Nguyen', mail: 'alice@example.com', role: Role.admin),
    const User(id: '2', firstName: 'Bob', lastName: 'Marchetti', mail: 'bob@example.com'),
    const User(id: '3', firstName: 'Carla', lastName: 'Ferreira', mail: 'carla@example.com'),
    const User(id: '4', firstName: 'David', lastName: 'Kim', mail: 'david@example.com'),
    const User(id: '5', firstName: 'Eva', lastName: 'Schulz', mail: 'eva@example.com'),
    const User(id: '6', firstName: 'Fabian', lastName: 'Rossi', mail: 'fabian.rossi@example.com', role: Role.admin),
    const User(id: '7', firstName: 'Grace', lastName: 'Okafor', mail: 'grace.okafor@example.com'),
    const User(id: '8', firstName: 'Hamid', lastName: 'Al-Rashid', mail: 'hamid.alrashid@example.com'),
    const User(id: '9', firstName: 'Ingrid', lastName: 'Lindqvist', mail: 'ingrid.lindqvist@example.com'),
    const User(id: '10', firstName: 'João', lastName: 'Costa', mail: 'joao.costa@example.com'),
    const User(id: '11', firstName: 'Keiko', lastName: 'Tanaka', mail: 'keiko.tanaka@example.com'),
    const User(id: '12', firstName: 'Liam', lastName: 'O\'Brien', mail: 'liam.obrien@example.com'),
    const User(id: '13', firstName: 'Maria', lastName: 'Vasquez', mail: 'maria.vasquez@example.com'),
    const User(id: '14', firstName: 'Nour', lastName: 'El-Amine', mail: 'nour.elamine@example.com'),
    const User(id: '15', firstName: 'Oscar', lastName: 'Petrov', mail: 'oscar.petrov@example.com'),
  ];

  @override
  Future<List<User>> getAllUsers({int? pageIndex, int? pageSize, String? q}) async {
    await Future.delayed(Duration(seconds: 2));

    var result = _users.toList();

    if (q != null && q.isNotEmpty) {
      final query = q.toLowerCase();
      result = result.where((u) {
        return (u.firstName?.toLowerCase().contains(query) ?? false) ||
            (u.lastName?.toLowerCase().contains(query) ?? false) ||
            (u.mail?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    if (pageIndex != null && pageSize != null) {
      final start = pageIndex * pageSize;
      if (start >= result.length) return [];
      result = result.skip(start).take(pageSize).toList();
    }

    return result;
  }

  @override
  Future<User> getUser(String id) async {
    await Future.delayed(Duration(seconds: 2));
    return _users.firstWhere(
      (u) => u.id == id,
      orElse: () =>
          throw AppException.httpError(statusCode: 404, title: 'Not Found Exception', message: 'User $id not found'),
    );
  }

  @override
  Future<void> deleteUser(String id) async {
    _users.removeWhere((u) => u.id == id);
  }

  @override
  Future<void> editUserRole(String id, Role role) async {
    final index = _users.indexWhere((u) => u.id == id);
    if (index == -1) {
      throw AppException.httpError(statusCode: 404, title: 'Not Found', message: 'User $id not found');
    }
    _users[index] = _users[index].copyWith(role: role);
  }
}
