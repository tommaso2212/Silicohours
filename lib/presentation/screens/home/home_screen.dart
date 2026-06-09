import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dialogService = ref.read(dialogServiceProvider.notifier);

    return AppScreen(
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(
            title: 'Homepage',
            description: 'Descrizione non troppo lunga.',
            actions: [
              ElevatedButton(
                onPressed: () => dialogService.showConfirmDialog(title: 'Confirm', message: 'Si o no?'),
                child: const Text('Show confirm Dialog'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
