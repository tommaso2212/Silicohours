import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef CreateProjectInput = ({String name, double hourPrice, String? colorHex});

class CreateProjectUsecase extends Usecase<Project, CreateProjectInput> {
  final ProjectRepository _projectRepository;

  const CreateProjectUsecase({
    required this._projectRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<Project> call(CreateProjectInput input) async {
    return _projectRepository.createProject(
      name: input.name,
      hourPrice: input.hourPrice,
      colorHex: input.colorHex,
    );
  }
}
