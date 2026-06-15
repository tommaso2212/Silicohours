import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension type MenuAction._(({String label, Future<void> Function() action, Widget? icon}) _) {
  MenuAction({required String label, required Future<void> Function() action, Widget? icon})
    : this._((label: label, action: action, icon: icon));

  MenuAction.edit({required Future<void> Function() action})
    : this._((label: 'Edit', action: action, icon: const Icon(Icons.edit_outlined)));

  MenuAction.delete({required Future<void> Function() action})
    : this._((label: 'Delete', action: action, icon: const Icon(Icons.delete_outline)));
}

class ActionMenu extends HookWidget {
  const ActionMenu({this.actions = const [], super.key});

  final List<MenuAction> actions;

  @override
  Widget build(BuildContext context) {
    final controller = useMenuController();
    return MenuAnchor(
      controller: controller,
      menuChildren: actions
          .map(
            (e) => ListTile(
              title: Text(e._.label),
              leading: e._.icon,
              onTap: () async {
                controller.close();
                await e._.action.call();
              },
            ),
          )
          .toList(),
      builder: (context, controller, child) =>
          IconButton(onPressed: () => controller.open(), icon: const Icon(Icons.more_vert_rounded)),
    );
  }
}

MenuController useMenuController() => use(_MenuControllerHook());

class _MenuControllerHook extends Hook<MenuController> {
  @override
  HookState<MenuController, Hook<MenuController>> createState() => _MenuControllerHookState();
}

class _MenuControllerHookState extends HookState<MenuController, _MenuControllerHook> {
  late final controller = MenuController();

  @override
  MenuController build(BuildContext context) => controller;

  @override
  void dispose() {}

  @override
  String get debugLabel => 'useMenuController';
}
