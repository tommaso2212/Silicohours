import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class CreateTaskDialog extends HookWidget {
  const CreateTaskDialog({required this.projectId, super.key});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final isValid = useListenableSelector(nameController, () => nameController.text.trim().isNotEmpty);

    void submit() {
      Navigator.of(context).pop<CreateTaskInput>((projectId: projectId, name: nameController.text.trim()));
    }

    return AppDialog(
      title: 'New task',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(onPressed: isValid ? submit : null, child: const Text('Create')),
      ],
      child: Column(
        spacing: AppSpacing.md,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Task name'),
          ),
        ],
      ),
    );
  }
}
