import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class CreateProjectDialog extends HookWidget {
  const CreateProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final hourPriceController = useTextEditingController();

    final isValid = useListenableSelector(Listenable.merge([nameController, hourPriceController]), () {
      final price = double.tryParse(hourPriceController.text.trim());
      return nameController.text.trim().isNotEmpty && price != null && price >= 0;
    });

    void submit() {
      Navigator.of(context).pop<CreateProjectInput>((
        name: nameController.text.trim(),
        hourPrice: double.parse(hourPriceController.text.trim()),
      ));
    }

    return AppDialog(
      title: 'New project',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(onPressed: isValid ? submit : null, child: const Text('Create')),
      ],
      child: Column(
        spacing: AppSpacing.xs,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Name'),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: hourPriceController,
            decoration: const InputDecoration(labelText: 'Hourly Rate (€)', suffixText: '/h'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
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
