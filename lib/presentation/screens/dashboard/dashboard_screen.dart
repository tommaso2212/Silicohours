import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScreen(
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(title: 'Dashboard', description: 'Descrizione non troppo lunga.'),
        ),
      ],
    );
  }
}
