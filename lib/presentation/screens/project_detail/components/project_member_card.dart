import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/user/user_name.dart';

class ProjectMemberCard extends StatelessWidget {
  const ProjectMemberCard({required this.membership, this.actionMenu, super.key});

  final ProjectMembership membership;
  final Widget? actionMenu;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(child: UserName(userId: membership.userId, iconRadius: 16)),
            ?actionMenu,
          ],
        ),
      ),
    );
  }
}
