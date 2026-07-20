import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/project/project_dropdown.dart';
import 'package:silicohours/presentation/adapters/task/task_dropdown.dart';
import 'package:silicohours/presentation/adapters/user/user_dropdown.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/utils/hooks/dropdown_controller_hook.dart';

class CreateTimeLogDialog extends HookWidget {
  const CreateTimeLogDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final projectDropdownController = useDropdownController<Project>();
    final taskDropdownController = useDropdownController<Task>();
    final userDropdownController = useDropdownController<User>();
    final hoursController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final date = useState<DateTime?>(null);

    final projectId = useListenableSelector(projectDropdownController, () => projectDropdownController.item?.id);
    useEffect(() => taskDropdownController.item = null, [projectId]);

    final isValid = useListenableSelector(
      Listenable.merge([
        projectDropdownController,
        taskDropdownController,
        userDropdownController,
        hoursController,
        date,
      ]),
      () {
        final hours = double.tryParse(hoursController.text.trim());
        return projectDropdownController.item != null &&
            taskDropdownController.item != null &&
            userDropdownController.item != null &&
            date.value != null &&
            hours != null &&
            hours > 0;
      },
    );

    void submit() {
      Navigator.of(context).pop<CreateTimeLogInput>((
        projectId: projectDropdownController.item!.id,
        taskId: taskDropdownController.item!.id,
        userId: userDropdownController.item!.id,
        hoursLogged: double.parse(hoursController.text.trim()),
        date: date.value!,
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
        spacing: AppSpacing.md,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProjectDropdown(controller: projectDropdownController),
          TaskDropdown(projectId: projectId, controller: taskDropdownController),
          UserDropdown(controller: userDropdownController),
          DatePicker(date: date.value, onChanged: (picked) => date.value = picked),
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
          ),
        ],
      ),
    );
  }
}
