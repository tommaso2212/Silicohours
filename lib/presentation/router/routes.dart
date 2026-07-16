import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/project/project_screen.dart';
import '../screens/project_detail/project_detail_screen.dart';
import '../screens/time_log/time_log_screen.dart';
import '../screens/user/user_screen.dart';

class HomeRoute extends GoRoute {
  HomeRoute() : super(path: pagePath, name: 'Homepage', builder: (context, state) => const HomeScreen());

  static const String pagePath = '/';
}

class UserRoute extends GoRoute {
  UserRoute() : super(path: pagePath, name: 'Users', builder: (context, state) => const UserScreen());

  static const String pagePath = '/users';
}

class ProjectRoute extends GoRoute {
  ProjectRoute()
    : super(
        path: pagePath,
        name: 'Projects',
        builder: (context, state) => const ProjectScreen(),
        routes: [
          GoRoute(
            path: ':id',
            redirect: (context, state) => state.pathParameters['id'] == null ? pagePath : null,
            builder: (context, state) => ProjectDetailScreen(projectId: state.pathParameters['id']!),
          ),
        ],
      );

  static const String pagePath = '/projects';

  static String pathForDetails(String id) => '${ProjectRoute.pagePath}/$id';
}

class TimeLogRoute extends GoRoute {
  TimeLogRoute() : super(path: pagePath, name: 'Time Logs', builder: (context, state) => const TimeLogScreen());

  static const String pagePath = '/time-logs';
}

List<GoRoute> sidebarRoutes = [HomeRoute(), UserRoute(), ProjectRoute(), TimeLogRoute()];

List<GoRoute> get appRoutes => [...sidebarRoutes];
