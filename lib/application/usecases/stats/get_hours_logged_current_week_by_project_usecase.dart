import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetHoursLoggedCurrentWeekByProjectInput = ({String userId});
typedef ProjectWeekHours = ({Project project, List<double> hoursByDay});

class GetHoursLoggedCurrentWeekByProjectUsecase
    extends Usecase<List<ProjectWeekHours>, GetHoursLoggedCurrentWeekByProjectInput> {
  final StatsRepository _statsRepository;
  final ProjectRepository _projectRepository;

  const GetHoursLoggedCurrentWeekByProjectUsecase({
    required this._statsRepository,
    required this._projectRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<ProjectWeekHours>> call(GetHoursLoggedCurrentWeekByProjectInput input) async {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final monday = todayDate.subtract(Duration(days: todayDate.weekday - 1));
    final sunday = monday.add(const Duration(days: 6));

    final hoursByDay = await _statsRepository.getHoursByProjectPerDay(
      from: monday,
      to: sunday,
      userId: input.userId,
    );

    final projectIds = <String>{for (final dayTotals in hoursByDay.values) ...dayTotals.keys};

    final projects = await _projectRepository.getAllProjects();
    final projectsById = {for (final project in projects) project.id: project};

    final result = [
      for (final projectId in projectIds)
        if (projectsById[projectId] case final project?)
          (
            project: project,
            hoursByDay: [
              for (var i = 0; i < 7; i++) hoursByDay[monday.add(Duration(days: i))]?[projectId] ?? 0.0,
            ],
          ),
    ];

    double total(ProjectWeekHours p) => p.hoursByDay.fold(0.0, (sum, hours) => sum + hours);
    result.sort((a, b) => total(b).compareTo(total(a)));
    return result;
  }
}
