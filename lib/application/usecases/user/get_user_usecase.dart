import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetUserInput = ({String id});

class GetUserUsecase extends Usecase<User, GetUserInput> {
  final UserRepository _userRepository;

  const GetUserUsecase({
    required this._userRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<User> call(GetUserInput input) async {
    return _userRepository.getUser(input.id);
  }
}
