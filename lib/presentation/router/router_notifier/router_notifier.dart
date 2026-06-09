import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_notifier.g.dart';

@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? _listener;

  @override
  Future<bool> build() async {
    listenSelf((_, _) => _listener?.call());
    return true;
  }

  String? redirect(BuildContext context, GoRouterState routerState) {
    return null;
  }

  @override
  void addListener(VoidCallback listener) => _listener = listener;

  @override
  void removeListener(VoidCallback listener) => _listener = null;
}
