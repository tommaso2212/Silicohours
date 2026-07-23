import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/user/user_dropdown.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/utils/hooks/dropdown_controller_hook.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDropdownController = useDropdownController<User>();
    final isSelected = useListenableSelector(userDropdownController, () => userDropdownController.item != null);
    final isLoggingIn = ref.watch(authServiceProvider).isLoading;

    Future<void> submit() async {
      final user = userDropdownController.item;
      if (user == null) return;
      await ref.read(authServiceProvider.notifier).login(user.id);
    }

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AppSpacing.lg,
              children: [
                const Center(child: Logo()),
                Text(
                  'Select an account to continue',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                UserDropdown(controller: userDropdownController, showRole: true),
                ElevatedButton(
                  onPressed: isSelected && !isLoggingIn ? submit : null,
                  child: isLoggingIn
                      ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
