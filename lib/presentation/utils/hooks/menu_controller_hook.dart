import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

MenuController useMenuController() => use(_MenuControllerHook());

class _MenuControllerHook extends Hook<MenuController> {
  @override
  HookState<MenuController, Hook<MenuController>> createState() => _MenuControllerHookState();
}

class _MenuControllerHookState extends HookState<MenuController, _MenuControllerHook> {
  final controller = MenuController();

  @override
  MenuController build(BuildContext context) => controller;

  @override
  String get debugLabel => 'useMenuController';
}
