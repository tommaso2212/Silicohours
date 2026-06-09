import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_state.freezed.dart';

@freezed
abstract class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.data({required List<T> items, required bool hasMorePages, required int page}) = Data;
  const factory PaginationState.loading({List<T>? items}) = Loading;
  const factory PaginationState.error(Object? e, {List<T>? items, StackTrace? stk}) = Error;
}
