import 'package:silicohours/application/application.dart';

typedef GetHoursLoggedCurrentMonthByProjectInput = ({String userId});

class GetHoursLoggedCurrentMonthByProjectUsecase
    extends Usecase<List<ProjectHours>, GetHoursLoggedCurrentMonthByProjectInput> {
  final StatsRepository _statsRepository;
  final ProjectRepository _projectRepository;

  const GetHoursLoggedCurrentMonthByProjectUsecase({
    required this._statsRepository,
    required this._projectRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<ProjectHours>> call(GetHoursLoggedCurrentMonthByProjectInput input) async {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final from = DateTime(today.year, today.month, 1);

    final hoursByDay = await _statsRepository.getHoursByProjectPerDay(from: from, to: todayDate, userId: input.userId);

    final hoursByProject = <String, double>{};
    for (final dayTotals in hoursByDay.values) {
      dayTotals.forEach((projectId, hours) {
        hoursByProject[projectId] = (hoursByProject[projectId] ?? 0) + hours;
      });
    }

    final projects = await _projectRepository.getAllProjects();
    final projectsById = {for (final project in projects) project.id: project};

    final result = [
      for (final entry in hoursByProject.entries)
        if (projectsById[entry.key] case final project?) (project: project, hours: entry.value),
    ];

    result.sort((a, b) => b.hours.compareTo(a.hours));
    return result;
  }
}
