import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/presentation/components/components.dart';

class CreateTaskDialog extends HookWidget {
  const CreateTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final isValid = useListenableSelector(nameController, () => nameController.text.trim().isNotEmpty);

    return AppDialog(
      title: 'New task',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(
          onPressed: isValid ? () => Navigator.of(context).pop(nameController.text.trim()) : null,
          child: const Text('Create'),
        ),
      ],
      child: TextField(
        controller: nameController,
        autofocus: true,
        decoration: const InputDecoration(labelText: 'Task name'),
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) Navigator.of(context).pop(value.trim());
        },
      ),
    );
  }
}
