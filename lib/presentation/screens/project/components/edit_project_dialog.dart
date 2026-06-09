import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project/controller/project_section_controller.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class EditProjectDialog extends ConsumerStatefulWidget {
  const EditProjectDialog({required this.project, super.key});

  final Project project;

  @override
  ConsumerState<EditProjectDialog> createState() => _EditProjectDialogState();
}

class _EditProjectDialogState extends ConsumerState<EditProjectDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _hourPriceController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.project.name);
    _hourPriceController = TextEditingController(text: widget.project.hourPrice.toStringAsFixed(2));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hourPriceController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    final updated = widget.project.copyWith(
      name: _nameController.text.trim(),
      hourPrice: double.parse(_hourPriceController.text.trim()),
    );

    await ref.read(updateProjectUsecaseProvider).execute((project: updated));

    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'Edit Project',
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _submit,
          child: _isLoading
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Save'),
        ),
      ],
      child: Form(
        key: _formKey,
        child: Column(
          spacing: AppSpacing.xs,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              textInputAction: TextInputAction.next,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Name is required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _hourPriceController,
              decoration: const InputDecoration(labelText: 'Hourly Rate (€)', suffixText: '/h'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Hourly rate is required';
                final parsed = double.tryParse(v.trim());
                if (parsed == null || parsed < 0) return 'Enter a valid rate';
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
