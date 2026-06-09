import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetAllUsersInput = ({int? pageIndex, int? pageSize, String? q});

class GetAllUsersUsecase extends Usecase<List<User>, GetAllUsersInput> {
  final UserRepository _userRepository;

  const GetAllUsersUsecase({
    required this._userRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<User>> call(GetAllUsersInput input) async {
    return _userRepository.getAllUsers(
      pageIndex: input.pageIndex,
      pageSize: input.pageSize,
      q: input.q,
    );
  }
}
