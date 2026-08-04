import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/services/repositories/project_membership_repository.dart';
import 'package:silicohours/infrastructure/repositories/project_membership/mock_project_membership_repository.dart';

final projectMembershipRepositoryProvider = Provider<ProjectMembershipRepository>((ref) {
  return MockProjectMembershipRepository();
});
