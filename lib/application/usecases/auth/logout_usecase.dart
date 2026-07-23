import 'package:silicohours/application/application.dart';

typedef LogoutInput = ();

class LogoutUsecase extends Usecase<void, LogoutInput> {
  final AuthRepository _authRepository;

  const LogoutUsecase({
    required this._authRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<void> call(LogoutInput input) async {
    return _authRepository.logout();
  }
}
