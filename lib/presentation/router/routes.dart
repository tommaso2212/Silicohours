import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/project/project_screen.dart';
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
  ProjectRoute() : super(path: pagePath, name: 'Projects', builder: (context, state) => const ProjectScreen());

  static const String pagePath = '/projects';
}

List<GoRoute> sidebarRoutes = [HomeRoute(), UserRoute(), ProjectRoute()];

List<GoRoute> get appRoutes => [...sidebarRoutes];
