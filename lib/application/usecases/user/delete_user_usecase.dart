import 'package:silicohours/application/application.dart';

typedef DeleteUserInput = ({String id});

class DeleteUserUsecase extends Usecase<void, DeleteUserInput> {
  final UserRepository _userRepository;

  const DeleteUserUsecase({
    required this._userRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<void> call(DeleteUserInput input) async {
    return _userRepository.deleteUser(input.id);
  }
}
