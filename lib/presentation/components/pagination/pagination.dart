import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/components/pagination/controller/pagination_controller.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

extension _PaginationScrollListener on ScrollController {
  void shouldFetchNextBatch(BuildContext context, void Function() fetchNextBatch) {
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;

    final renderObject = context.findRenderObject();
    final height = switch (renderObject) {
      RenderBox(:final size) => size.height,
      RenderSliverMainAxisGroup() => MediaQuery.of(context).size.height,
      RenderObject() => null,
      null => null,
    };

    final delta = (height ?? 1) * 0.5;
    if (maxScroll - currentScroll <= delta && context.mounted) {
      fetchNextBatch();
    }
  }
}

class Pagination<T> extends HookConsumerWidget {
  const Pagination({
    required this.fetchItems,
    required this.itemsBuilder,
    this.emptyBuilder,
    this.loaderBuilder,
    this.errorBuilder,
    this.scrollController,
    super.key,
  }) : _sliver = false;

  const Pagination.sliver({
    required this.fetchItems,
    required this.itemsBuilder,
    this.emptyBuilder,
    this.loaderBuilder,
    this.errorBuilder,
    this.scrollController,
    super.key,
  }) : _sliver = true;

  final bool _sliver;

  final Future<List<T>> Function(int page, int limit) fetchItems;

  final Widget Function(List<T> items) itemsBuilder;
  final Widget Function()? emptyBuilder;
  final Widget Function()? loaderBuilder;
  final Widget Function()? errorBuilder;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerProvider = paginationControllerProvider(fetchItems);
    final paginationState = ref.watch(controllerProvider);

    useEffect(() {
      final controller = scrollController;
      if (controller == null) return null;
      void listener() => controller.shouldFetchNextBatch(context, ref.read(controllerProvider.notifier).fetchNextBatch);
      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [scrollController, controllerProvider]);

    if (_sliver) {
      return SliverMainAxisGroup(
        slivers: [
          if (paginationState.items != null) itemsBuilder.call(paginationState.items!.map((e) => e as T).toList()),
          SliverToBoxAdapter(
            child: paginationState.map(
              data: (value) =>
                  value.items.isEmpty ? emptyBuilder?.call() ?? PaginationEmpty() : const SizedBox.shrink(),
              loading: (value) => loaderBuilder?.call() ?? PaginationLoader(),
              error: (value) => errorBuilder?.call() ?? PaginationError(retry: () => ref.refresh(controllerProvider)),
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (paginationState.items != null) itemsBuilder.call(paginationState.items!.map((e) => e as T).toList()),

        paginationState.map(
          data: (value) => value.items.isEmpty ? emptyBuilder?.call() ?? PaginationEmpty() : const SizedBox.shrink(),
          loading: (value) => loaderBuilder?.call() ?? PaginationLoader(),
          error: (value) => errorBuilder?.call() ?? PaginationError(retry: () => ref.refresh(controllerProvider)),
        ),
      ],
    );
  }
}

class PaginationEmpty extends StatelessWidget {
  const PaginationEmpty({this.emptyDescription = 'No results found for your search.', super.key});

  final String emptyDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          emptyDescription,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.onSurfaceMuted),
        ),
      ),
    );
  }
}

class PaginationLoader extends StatelessWidget {
  const PaginationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: CircularProgressIndicator()),
    );
  }
}

class PaginationError extends StatelessWidget {
  const PaginationError({this.errorDescription = 'Something went wrong.', this.retry, super.key});

  final String errorDescription;
  final void Function()? retry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text(
            errorDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.onSurfaceMuted),
          ),
          if (retry != null)
            FilledButton.icon(icon: Icon(Icons.refresh_outlined), onPressed: retry, label: Text('Retry')),
        ],
      ),
    );
  }
}
