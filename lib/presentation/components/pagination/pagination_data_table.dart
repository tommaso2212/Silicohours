import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/components/pagination/pagination.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class PaginationDataTable<T> extends HookConsumerWidget {
  const PaginationDataTable({
    required this.fetchItems,
    required this.columnsNumber,
    required this.headerBuilder,
    required this.cellBuilder,
    this.onRowTap,
    this.scrollController,
    super.key,
  });

  final Future<List<T>> Function(int page, int limit) fetchItems;

  final int columnsNumber;
  final Widget Function(int index) headerBuilder;
  final Widget Function(int index, T item) cellBuilder;
  final void Function(T item)? onRowTap;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horizontalScrollController = useScrollController();
    return Pagination(
      fetchItems: fetchItems,
      scrollController: scrollController,
      itemsBuilder: (items) => LayoutBuilder(
        builder: (context, constraints) => Scrollbar(
          controller: horizontalScrollController,
          child: SingleChildScrollView(
            controller: horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.minWidth),
              child: DataTable(
                border: TableBorder(
                  horizontalInside: BorderSide(color: Theme.of(context).dividerTheme.color ?? AppColors.surfaceVariant),
                ),
                headingTextStyle: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w500),
                dataTextStyle: Theme.of(context).textTheme.labelLarge,
                showCheckboxColumn: false,
                columns: List.generate(columnsNumber, (index) => DataColumn(label: headerBuilder(index))),
                rows: items
                    .map(
                      (e) => DataRow(
                        onSelectChanged: onRowTap == null ? null : (_) => onRowTap?.call(e),
                        cells: List.generate(columnsNumber, (index) => DataCell(cellBuilder(index, e))),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
