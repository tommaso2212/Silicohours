import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

extension type MenuAction._(({String label, Future<void> Function() action, Widget? icon, Color? color}) _) {
  MenuAction({required String label, required Future<void> Function() action, Widget? icon, Color? color})
    : this._((label: label, action: action, icon: icon, color: color));

  MenuAction.edit({required Future<void> Function() action})
    : this._((label: 'Edit', action: action, icon: const Icon(Icons.edit_outlined), color: null));

  MenuAction.delete({required Future<void> Function() action})
    : this._((label: 'Delete', action: action, icon: const Icon(Icons.delete_outline), color: AppColors.error));
}

class ActionMenu extends HookWidget {
  const ActionMenu({this.actions = const [], super.key});

  final List<MenuAction> actions;

  @override
  Widget build(BuildContext context) {
    final controller = useMenuController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MenuAnchor(
        controller: controller,
        menuChildren: actions
            .map(
              (e) => Directionality(
                textDirection: TextDirection.ltr,
                child: MenuItemButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: AppSpacing.md)),
                    iconColor: WidgetStatePropertyAll(e._.color),
                    iconSize: WidgetStatePropertyAll(16),
                  ),
                  onPressed: () async {
                    controller.close();
                    await e._.action.call();
                  },
                  child: Row(
                    spacing: AppSpacing.sm,
                    children: [
                      ?e._.icon,
                      Text(e._.label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: e._.color)),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        builder: (context, controller, child) =>
            IconButton(onPressed: () => controller.toggle(), icon: const Icon(Icons.more_vert_rounded)),
      ),
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

extension on MenuController {
  void toggle() => isOpen ? close() : open();
}
