import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/presentation/utils/color_helper.dart';

class ColorPickerController extends TextEditingController {
  ColorPickerController({super.text});

  String _hsvToHex(HSVColor hsv) {
    final c = hsv.toColor();
    return ColorHelper.toHex(c)!;
  }

  HSVColor? _hexToHsv(String? hex) {
    final color = ColorHelper.fromHex(hex);
    if (color == null) return null;
    return HSVColor.fromColor(color);
  }

  void setColor(HSVColor? color) {
    text = color == null ? '' : _hsvToHex(color);
  }

  HSVColor? get color => _hexToHsv(text);
}

ColorPickerController useColorPickerController({String? text}) => use(_ColorPickerControllerHook(initialText: text));

class _ColorPickerControllerHook extends Hook<ColorPickerController> {
  const _ColorPickerControllerHook({this.initialText});

  final String? initialText;

  @override
  HookState<ColorPickerController, Hook<ColorPickerController>> createState() => _ColorPickerControllerHookState();
}

class _ColorPickerControllerHookState extends HookState<ColorPickerController, _ColorPickerControllerHook> {
  late final controller = ColorPickerController(text: hook.initialText);

  @override
  ColorPickerController build(BuildContext context) => controller;

  @override
  void dispose() {}

  @override
  String get debugLabel => 'useColorPickerController';
}
