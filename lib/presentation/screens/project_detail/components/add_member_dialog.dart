import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/user/user_dropdown.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/utils/hooks/dropdown_controller_hook.dart';

class AddMemberDialog extends HookConsumerWidget {
  const AddMemberDialog({required this.projectId, super.key});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actor = ref.watch(authServiceProvider).value;

    final userDropdownController = useDropdownController<User>();
    final isValid = useListenableSelector(
      userDropdownController,
      () => userDropdownController.item != null && actor != null,
    );

    void submit() {
      Navigator.of(context).pop<AddProjectMemberInput>((
        actor: actor!,
        projectId: projectId,
        userId: userDropdownController.item!.id,
      ));
    }

    return AppDialog(
      title: 'Add member',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        ElevatedButton(onPressed: isValid ? submit : null, child: const Text('Add')),
      ],
      child: Column(
        spacing: AppSpacing.md,
        mainAxisSize: MainAxisSize.min,
        children: [UserDropdown(controller: userDropdownController, showRole: true)],
      ),
    );
  }
}
