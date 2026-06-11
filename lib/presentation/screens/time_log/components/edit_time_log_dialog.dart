import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class EditTimeLogDialog extends HookWidget {
  const EditTimeLogDialog({required this.timeLog, super.key});

  final TimeLog timeLog;

  @override
  Widget build(BuildContext context) {
    final hoursController = useTextEditingController();
    final descriptionController = useTextEditingController();

    useEffect(() {
      hoursController.text = timeLog.hoursLogged % 1 == 0
          ? timeLog.hoursLogged.toInt().toString()
          : timeLog.hoursLogged.toString();
      descriptionController.text = timeLog.description ?? '';
      return null;
    }, const []);

    final isValid = useListenableSelector(
      hoursController,
      () {
        final hours = double.tryParse(hoursController.text.trim());
        return hours != null && hours > 0;
      },
    );

    void submit() {
      Navigator.of(context).pop<EditTimeLogInput>((
        id: timeLog.id,
        hoursLogged: double.parse(hoursController.text.trim()),
        description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
      ));
    }

    return AppDialog(
      title: 'Edit time log',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(onPressed: isValid ? submit : null, child: const Text('Save')),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.sm,
        children: [
          TextField(
            controller: hoursController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Hours logged', suffixText: 'h'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description (optional)'),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              if (isValid) submit();
            },
          ),
        ],
      ),
    );
  }
}
