import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/presentation/components/pagination/pagination_dropdown.dart';

DropdownController<T> useDropdownController<T>() => use(_DropdownControllerHook<T>());

class _DropdownControllerHook<T> extends Hook<DropdownController<T>> {
  @override
  HookState<DropdownController<T>, Hook<DropdownController<T>>> createState() => _DropdownControllerHookState<T>();
}

class _DropdownControllerHookState<T> extends HookState<DropdownController<T>, _DropdownControllerHook<T>> {
  final dropdownController = DropdownController<T>();

  @override
  DropdownController<T> build(BuildContext context) => dropdownController;

  @override
  String get debugLabel => 'useDropdownController';
}
