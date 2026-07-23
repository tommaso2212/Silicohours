import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/presentation/router/routes.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';

part 'router_notifier.g.dart';

@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? _listener;

  @override
  Future<bool> build() async {
    ref.watch(authServiceProvider);
    listenSelf((_, _) => _listener?.call());
    return true;
  }

  String? redirect(BuildContext context, GoRouterState routerState) {
    final authState = ref.read(authServiceProvider);
    if (authState.isLoading) return null;

    final isLoggedIn = authState.value != null;
    final isLoggingIn = routerState.matchedLocation == LoginRoute.pagePath;

    if (!isLoggedIn) return isLoggingIn ? null : LoginRoute.pagePath;
    if (isLoggingIn) return DashboardRoute.pagePath;
    return null;
  }

  @override
  void addListener(VoidCallback listener) => _listener = listener;

  @override
  void removeListener(VoidCallback listener) => _listener = null;
}
