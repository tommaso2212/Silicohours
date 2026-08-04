import 'package:go_router/go_router.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/project/project_screen.dart';
import '../screens/project_detail/project_detail_screen.dart';
import '../screens/time_log/time_log_screen.dart';
import '../screens/user/user_screen.dart';

/// Marks a route that is only reachable by users with [Role.admin].
///
/// Such routes are filtered out of the sidebar and blocked by
/// `RouterNotifier.redirect` for everyone else.
mixin AdminRoute on GoRoute {}

class DashboardRoute extends GoRoute {
  DashboardRoute()
    : super(path: pagePath, name: 'Dashboard', builder: (context, state) => const DashboardScreen());

  static const String pagePath = '/';
}

class UserRoute extends GoRoute with AdminRoute {
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

class LoginRoute extends GoRoute {
  LoginRoute() : super(path: pagePath, name: 'Login', builder: (context, state) => const LoginScreen());

  static const String pagePath = '/login';
}

List<GoRoute> sidebarRoutes = [DashboardRoute(), UserRoute(), ProjectRoute(), TimeLogRoute()];

List<GoRoute> get appRoutes => [...sidebarRoutes, LoginRoute()];

/// Routes to show in the sidebar for a user with the given admin status.
List<GoRoute> sidebarRoutesFor({required bool isAdmin}) =>
    sidebarRoutes.where((route) => isAdmin || route is! AdminRoute).toList();

/// Whether [location] points at an [AdminRoute] (or one of its sub-routes).
bool isAdminOnlyLocation(String location) => appRoutes
    .whereType<AdminRoute>()
    .any((route) => location == route.path || location.startsWith('${route.path}/'));
