import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class CreateTimeLogDialog extends HookWidget {
  const CreateTimeLogDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final projectIdController = useTextEditingController();
    final taskIdController = useTextEditingController();
    final userIdController = useTextEditingController();
    final hoursController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final isValid = useListenableSelector(
      Listenable.merge([projectIdController, taskIdController, userIdController, hoursController]),
      () {
        final hours = double.tryParse(hoursController.text.trim());
        return projectIdController.text.trim().isNotEmpty &&
            taskIdController.text.trim().isNotEmpty &&
            userIdController.text.trim().isNotEmpty &&
            hours != null &&
            hours > 0;
      },
    );

    void submit() {
      Navigator.of(context).pop<CreateTimeLogInput>((
        projectId: projectIdController.text.trim(),
        taskId: taskIdController.text.trim(),
        userId: userIdController.text.trim(),
        hoursLogged: double.parse(hoursController.text.trim()),
        description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
      ));
    }

    return AppDialog(
      title: 'New time log',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(onPressed: isValid ? submit : null, child: const Text('Create')),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.sm,
        children: [
          TextField(
            controller: projectIdController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Project ID'),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: taskIdController,
            decoration: const InputDecoration(labelText: 'Task ID'),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: userIdController,
            decoration: const InputDecoration(labelText: 'User ID'),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: hoursController,
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
