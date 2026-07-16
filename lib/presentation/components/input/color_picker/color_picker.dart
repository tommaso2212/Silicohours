import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/components/input/color_picker/color_picker_controller.dart';
import 'package:silicohours/presentation/components/input/color_picker/color_picker_dialog.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/theme/app_theme.dart';
import 'package:silicohours/presentation/utils/color_helper.dart';

class ColorPicker extends HookConsumerWidget {
  const ColorPicker({this.initialHexColor, this.onChanged, super.key});

  final String? initialHexColor;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useColorPickerController(text: initialHexColor);
    useOnListenableChange(controller, () => onChanged?.call(ColorHelper.toHex(controller.color?.toColor())));

    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Color',
        prefixText: '#',
        counterText: '',
        suffixIcon: Padding(
          padding: EdgeInsetsGeometry.all(4).add(EdgeInsetsGeometry.only(right: 4)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.xs,
            children: [
              if (controller.color != null)
                DecoratedBox(
                  decoration: BoxDecoration(borderRadius: AppTheme.borderRadius, color: controller.color?.toColor()),
                  child: SizedBox.square(dimension: 24),
                ),
              InkWell(
                borderRadius: AppTheme.borderRadius,
                onTap: () async {
                  final color = await ref
                      .read(dialogServiceProvider.notifier)
                      .showCustomDialog<HSVColor>(
                        builder: (context) =>
                            ColorPickerDialog(initialHsv: controller.color ?? const HSVColor.fromAHSV(1, 0, 0, 0)),
                      );
                  if (color != null) {
                    controller.setColor(color);
                  }
                },
                child: Icon(Icons.colorize, color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
      maxLength: 6,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9a-fA-F]'))],
    );
  }
}
