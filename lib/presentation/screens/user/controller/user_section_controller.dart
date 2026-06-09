import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/utils/debounce_mixin.dart';

part 'user_section_controller.g.dart';

@Riverpod(keepAlive: false)
class FetchUsersFilter extends _$FetchUsersFilter with DebounceMixin {
  @override
  String? build() => null;

  void set(String? value) => debounce(() => state = value?.isEmpty == true ? null : value);
}

@riverpod
Future<List<User>> Function(int, int) fetchUsers(Ref ref) {
  final repo = ref.watch(userRepositoryProvider);
  final filter = ref.watch(fetchUsersFilterProvider);
  final usecase = GetAllUsersUsecase(userRepository: repo);
  return (page, limit) => usecase
      .execute((pageIndex: page, pageSize: limit, q: filter))
      .map(onResult: (result) => result, onError: (error) => []);
}

@Riverpod(keepAlive: true)
DeleteUserUsecase deleteUserUsecase(Ref ref) {
  return DeleteUserUsecase(
    userRepository: ref.watch(userRepositoryProvider),
    validatorHandlers: [ref.dialogConfirmHandler()],
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchUsersProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}

@Riverpod(keepAlive: true)
EditUserRoleUsecase editUserRoleUsecase(Ref ref) {
  return EditUserRoleUsecase(
    userRepository: ref.watch(userRepositoryProvider),
    validatorHandlers: [ref.dialogConfirmHandler()],
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchUsersProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}
