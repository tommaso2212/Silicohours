import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef EditUserRoleInput = ({String id, Role role});

class EditUserRoleUsecase extends Usecase<void, EditUserRoleInput> {
  final UserRepository _userRepository;

  const EditUserRoleUsecase({
    required this._userRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<void> call(EditUserRoleInput input) async {
    return _userRepository.editUserRole(input.id, input.role);
  }
}
