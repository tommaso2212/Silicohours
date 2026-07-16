import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/theme/app_theme.dart';

part 'hue_slider.dart';
part 'saturation_picker.dart';

class ColorPickerDialog extends HookWidget {
  const ColorPickerDialog({required this.initialHsv, super.key});

  final HSVColor initialHsv;

  @override
  Widget build(BuildContext context) {
    final selectedHsv = useState<HSVColor>(initialHsv);
    return AlertDialog(
      title: const Text('Pick a color'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.sm,
        children: [
          SaturationValuePicker(hsv: selectedHsv.value, onChanged: (hsv) => selectedHsv.value = hsv),
          HueSlider(hue: selectedHsv.value.hue, onChanged: (h) => selectedHsv.value = selectedHsv.value.withHue(h)),
          Flexible(child: ColorPreviewBar(color: selectedHsv.value.toColor())),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(selectedHsv.value),
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        ),
      ],
    );
  }
}

class ColorPreviewBar extends StatelessWidget {
  const ColorPreviewBar({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: AppTheme.borderRadius, color: color),
      child: SizedBox(height: 24),
    );
  }
}
