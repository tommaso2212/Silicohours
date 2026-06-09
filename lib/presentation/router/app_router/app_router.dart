import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../routes.dart';
import '../router_notifier/router_notifier.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(Ref ref) {
  return GlobalKey<NavigatorState>();
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final key = ref.watch(navigatorKeyProvider);
  final notifier = ref.watch(routerProvider.notifier);
  return GoRouter(
    navigatorKey: key,
    initialLocation: HomeRoute.pagePath,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: appRoutes,
  );
}
