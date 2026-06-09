import 'package:flutter/material.dart';
import 'package:silicohours/presentation/components/pagination/pagination.dart';

class PaginationList<T> extends StatelessWidget {
  const PaginationList({required this.fetchItems, required this.itemBuilder, this.scrollController, super.key})
    : _sliver = false;
  const PaginationList.sliver({required this.fetchItems, required this.itemBuilder, this.scrollController, super.key})
    : _sliver = true;

  final Future<List<T>> Function(int page, int limit) fetchItems;
  final Widget Function(T item) itemBuilder;

  final ScrollController? scrollController;
  final bool _sliver;

  @override
  Widget build(BuildContext context) {
    if (_sliver) {
      return Pagination.sliver(
        fetchItems: fetchItems,
        scrollController: scrollController,
        itemsBuilder: (items) => SliverList.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox.square(dimension: 8),
          itemBuilder: (context, index) => itemBuilder(items[index]),
        ),
      );
    }
    return Pagination(
      fetchItems: fetchItems,
      scrollController: scrollController,
      itemsBuilder: (items) => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox.square(dimension: 8),
        itemCount: items.length,
        itemBuilder: (context, index) => itemBuilder(items[index]),
      ),
    );
  }
}
