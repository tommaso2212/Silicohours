import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef LoginInput = ({String userId});

class LoginUsecase extends Usecase<User, LoginInput> {
  final AuthRepository _authRepository;

  const LoginUsecase({
    required this._authRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<User> call(LoginInput input) async {
    return _authRepository.login(input.userId);
  }
}
