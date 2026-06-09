import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silicohours/presentation/components/icons/initials_avatar.dart';
import 'package:silicohours/presentation/components/page/logo.dart';
import 'package:silicohours/presentation/router/routes.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerTheme = Theme.of(context).drawerTheme;
    return Container(
      constraints: BoxConstraints(minWidth: drawerTheme.width ?? 0, maxWidth: drawerTheme.width ?? 0),
      decoration: BoxDecoration(color: drawerTheme.backgroundColor),
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: [_SidebarHeader(), _SidebarRoutes(), Spacer(), _SidebarFooter()]),
          ),
        ],
      ),
    );
  }
}

class _SidebarHeader extends StatelessWidget {
  const _SidebarHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: Theme.of(context).dividerColor)),
      ),
      padding: EdgeInsets.all(20),
      child: Align(alignment: AlignmentGeometry.centerLeft, child: const Logo()),
    );
  }
}

class _SidebarRoutes extends StatelessWidget {
  const _SidebarRoutes();

  String? getCurrentPath(BuildContext context) {
    try {
      return context.dependOnInheritedWidgetOfExactType<InheritedGoRouter>()?.goRouter.state.path;
    } catch (_) {
      return null;
    }
  }

  Widget? routeIcon(String path) => switch (path) {
    HomeRoute.pagePath => Icon(Icons.home_outlined),
    UserRoute.pagePath => Icon(Icons.people_outline_rounded),
    ProjectRoute.pagePath => Icon(Icons.folder_outlined),
    String() => null,
  };

  @override
  Widget build(BuildContext context) {
    final currentPath = getCurrentPath(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: sidebarRoutes
            .map(
              (e) => ElevatedButton.icon(
                onPressed: () => context.go(e.path),
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(AppSpacing.lg)),
                  alignment: AlignmentGeometry.centerLeft,
                  backgroundColor: e.path == currentPath ? null : WidgetStatePropertyAll(Colors.transparent),
                ),
                icon: routeIcon(e.path),
                label: Text(e.name ?? e.path),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SidebarFooter extends StatelessWidget {
  const _SidebarFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 2, color: Theme.of(context).dividerColor)),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InitialsAvatar(initials: 'MR'),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text('Mario Rossi', softWrap: true, style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  'Ruolo',
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceMuted),
                ),
              ],
            ),
          ),
          IconButton(tooltip: 'Logout', onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}
