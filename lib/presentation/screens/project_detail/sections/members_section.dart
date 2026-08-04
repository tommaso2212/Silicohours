import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project_detail/components/project_member_card.dart';
import 'package:silicohours/presentation/screens/project_detail/controller/project_detail_controller.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class MembersSection extends HookConsumerWidget {
  const MembersSection({required this.projectId, this.scrollController, super.key});

  final String projectId;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchItems = ref.watch(fetchProjectMembershipsProvider(projectId));
    final currentUser = ref.watch(authServiceProvider).value;
    final canManage = currentUser?.canManageMemberships ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: 'Members', description: 'People who can access this project'),
        const SizedBox(height: AppSpacing.md),
        PaginationList(
          scrollController: scrollController,
          fetchItems: fetchItems,
          emptyBuilder: () => const PaginationEmpty(emptyDescription: 'No members yet.'),
          itemBuilder: (membership) => ProjectMemberCard(
            membership: membership,
            actionMenu: canManage && currentUser != null
                ? IconButton(
                    tooltip: 'Remove member',
                    onPressed: () =>
                        ref.read(removeProjectMemberUsecaseProvider).execute((actor: currentUser, id: membership.id)),
                    icon: const Icon(Icons.person_remove_outlined),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
