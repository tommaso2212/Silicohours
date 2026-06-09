// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationState<T> {

 List<T>? get items;
/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationStateCopyWith<T, PaginationState<T>> get copyWith => _$PaginationStateCopyWithImpl<T, PaginationState<T>>(this as PaginationState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationState<T>&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'PaginationState<$T>(items: $items)';
}


}

/// @nodoc
abstract mixin class $PaginationStateCopyWith<T,$Res>  {
  factory $PaginationStateCopyWith(PaginationState<T> value, $Res Function(PaginationState<T>) _then) = _$PaginationStateCopyWithImpl;
@useResult
$Res call({
 List<T> items
});




}
/// @nodoc
class _$PaginationStateCopyWithImpl<T,$Res>
    implements $PaginationStateCopyWith<T, $Res> {
  _$PaginationStateCopyWithImpl(this._self, this._then);

  final PaginationState<T> _self;
  final $Res Function(PaginationState<T>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items! : items // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationState].
extension PaginationStatePatterns<T> on PaginationState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Data<T> value)?  data,TResult Function( Loading<T> value)?  loading,TResult Function( Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Data<T> value)  data,required TResult Function( Loading<T> value)  loading,required TResult Function( Error<T> value)  error,}){
final _that = this;
switch (_that) {
case Data():
return data(_that);case Loading():
return loading(_that);case Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Data<T> value)?  data,TResult? Function( Loading<T> value)?  loading,TResult? Function( Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<T> items,  bool hasMorePages,  int page)?  data,TResult Function( List<T>? items)?  loading,TResult Function( Object? e,  List<T>? items,  StackTrace? stk)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that.items,_that.hasMorePages,_that.page);case Loading() when loading != null:
return loading(_that.items);case Error() when error != null:
return error(_that.e,_that.items,_that.stk);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<T> items,  bool hasMorePages,  int page)  data,required TResult Function( List<T>? items)  loading,required TResult Function( Object? e,  List<T>? items,  StackTrace? stk)  error,}) {final _that = this;
switch (_that) {
case Data():
return data(_that.items,_that.hasMorePages,_that.page);case Loading():
return loading(_that.items);case Error():
return error(_that.e,_that.items,_that.stk);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<T> items,  bool hasMorePages,  int page)?  data,TResult? Function( List<T>? items)?  loading,TResult? Function( Object? e,  List<T>? items,  StackTrace? stk)?  error,}) {final _that = this;
switch (_that) {
case Data() when data != null:
return data(_that.items,_that.hasMorePages,_that.page);case Loading() when loading != null:
return loading(_that.items);case Error() when error != null:
return error(_that.e,_that.items,_that.stk);case _:
  return null;

}
}

}

/// @nodoc


class Data<T> implements PaginationState<T> {
  const Data({required final  List<T> items, required this.hasMorePages, required this.page}): _items = items;
  

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  bool hasMorePages;
 final  int page;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<T, Data<T>> get copyWith => _$DataCopyWithImpl<T, Data<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMorePages, hasMorePages) || other.hasMorePages == hasMorePages)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasMorePages,page);

@override
String toString() {
  return 'PaginationState<$T>.data(items: $items, hasMorePages: $hasMorePages, page: $page)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<T,$Res> implements $PaginationStateCopyWith<T, $Res> {
  factory $DataCopyWith(Data<T> value, $Res Function(Data<T>) _then) = _$DataCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, bool hasMorePages, int page
});




}
/// @nodoc
class _$DataCopyWithImpl<T,$Res>
    implements $DataCopyWith<T, $Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data<T> _self;
  final $Res Function(Data<T>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasMorePages = null,Object? page = null,}) {
  return _then(Data<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,hasMorePages: null == hasMorePages ? _self.hasMorePages : hasMorePages // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Loading<T> implements PaginationState<T> {
  const Loading({final  List<T>? items}): _items = items;
  

 final  List<T>? _items;
@override List<T>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<T, Loading<T>> get copyWith => _$LoadingCopyWithImpl<T, Loading<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PaginationState<$T>.loading(items: $items)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<T,$Res> implements $PaginationStateCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 List<T>? items
});




}
/// @nodoc
class _$LoadingCopyWithImpl<T,$Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading<T> _self;
  final $Res Function(Loading<T>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,}) {
  return _then(Loading<T>(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>?,
  ));
}


}

/// @nodoc


class Error<T> implements PaginationState<T> {
  const Error(this.e, {final  List<T>? items, this.stk}): _items = items;
  

 final  Object? e;
 final  List<T>? _items;
@override List<T>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  StackTrace? stk;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&const DeepCollectionEquality().equals(other.e, e)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.stk, stk) || other.stk == stk));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(e),const DeepCollectionEquality().hash(_items),stk);

@override
String toString() {
  return 'PaginationState<$T>.error(e: $e, items: $items, stk: $stk)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $PaginationStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@override @useResult
$Res call({
 Object? e, List<T>? items, StackTrace? stk
});




}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? e = freezed,Object? items = freezed,Object? stk = freezed,}) {
  return _then(Error<T>(
freezed == e ? _self.e : e ,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>?,stk: freezed == stk ? _self.stk : stk // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
