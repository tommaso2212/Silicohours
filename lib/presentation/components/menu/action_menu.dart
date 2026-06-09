import 'package:flutter/material.dart';

extension type MenuAction._(({String label, Future<void> Function() action, Widget? icon}) _) {
  MenuAction({required String label, required Future<void> Function() action, Widget? icon})
    : this._((label: label, action: action, icon: icon));
}

class ActionMenu extends StatefulWidget {
  const ActionMenu({this.actions = const [], super.key});

  final List<MenuAction> actions;

  @override
  State<ActionMenu> createState() => _ActionMenuState();
}

class _ActionMenuState extends State<ActionMenu> {
  late MenuController controller;

  @override
  void initState() {
    super.initState();
    controller = MenuController();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      menuChildren: widget.actions
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
