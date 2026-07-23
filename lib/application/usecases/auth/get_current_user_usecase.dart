import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetCurrentUserInput = ();

class GetCurrentUserUsecase extends Usecase<User?, GetCurrentUserInput> {
  final AuthRepository _authRepository;

  const GetCurrentUserUsecase({
    required this._authRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<User?> call(GetCurrentUserInput input) async {
    return _authRepository.getCurrentUser();
  }
}
