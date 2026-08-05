import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/presentation/components/pagination/pagination_dropdown.dart';

DropdownController<T> useDropdownController<T>({T? initialValue}) =>
    use(_DropdownControllerHook<T>(initialValue: initialValue));

class _DropdownControllerHook<T> extends Hook<DropdownController<T>> {
  const _DropdownControllerHook({this.initialValue});

  final T? initialValue;

  @override
  HookState<DropdownController<T>, Hook<DropdownController<T>>> createState() => _DropdownControllerHookState<T>();
}

class _DropdownControllerHookState<T> extends HookState<DropdownController<T>, _DropdownControllerHook<T>> {
  late final dropdownController = DropdownController<T>(initialValue: hook.initialValue);

  @override
  DropdownController<T> build(BuildContext context) => dropdownController;

  @override
  String get debugLabel => 'useDropdownController';
}
