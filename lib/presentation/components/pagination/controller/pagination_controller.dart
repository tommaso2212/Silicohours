export 'state/pagination_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/pagination_state.dart';

part 'pagination_controller.g.dart';

@riverpod
class PaginationController extends _$PaginationController {
  @override
  PaginationState<dynamic> build(
    Future<List<dynamic>> Function(int pageIndex, int pageSize) fetchItems, {
    int pageSize = 20,
  }) {
    _fetchBatch();
    return PaginationState.loading(items: []);
  }

  Future<void> _fetchBatch({int pageIndex = 0}) async {
    if (!ref.mounted) return;
    try {
      final result = await fetchItems(pageIndex, pageSize);
      if (!ref.mounted) return;
      final currentItems = state.items ?? [];
      state = PaginationState.data(
        items: [...currentItems, ...result],
        hasMorePages: result.isNotEmpty && result.length == pageSize,
        page: pageIndex,
      );
    } catch (e, stk) {
      final currentItems = state.items ?? [];
      state = PaginationState.error(e, items: currentItems, stk: stk);
    }
  }

  Future<void> fetchNextBatch() async {
    final prevState = state.mapOrNull(data: (value) => value);
    if (prevState == null || !prevState.hasMorePages) return Future.value();
    if (!ref.mounted) return;
    state = PaginationState.loading(items: prevState.items);
    await _fetchBatch(pageIndex: prevState.page + 1);
  }
}
