// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeLog {

 String get id; String get projectId; String get taskId; String get userId; double get hoursLogged; String? get description;
/// Create a copy of TimeLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeLogCopyWith<TimeLog> get copyWith => _$TimeLogCopyWithImpl<TimeLog>(this as TimeLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeLog&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.hoursLogged, hoursLogged) || other.hoursLogged == hoursLogged)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,projectId,taskId,userId,hoursLogged,description);

@override
String toString() {
  return 'TimeLog(id: $id, projectId: $projectId, taskId: $taskId, userId: $userId, hoursLogged: $hoursLogged, description: $description)';
}


}

/// @nodoc
abstract mixin class $TimeLogCopyWith<$Res>  {
  factory $TimeLogCopyWith(TimeLog value, $Res Function(TimeLog) _then) = _$TimeLogCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String taskId, String userId, double hoursLogged, String? description
});




}
/// @nodoc
class _$TimeLogCopyWithImpl<$Res>
    implements $TimeLogCopyWith<$Res> {
  _$TimeLogCopyWithImpl(this._self, this._then);

  final TimeLog _self;
  final $Res Function(TimeLog) _then;

/// Create a copy of TimeLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? taskId = null,Object? userId = null,Object? hoursLogged = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,hoursLogged: null == hoursLogged ? _self.hoursLogged : hoursLogged // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeLog].
extension TimeLogPatterns on TimeLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeLog() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeLog value)  $default,){
final _that = this;
switch (_that) {
case _TimeLog():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeLog value)?  $default,){
final _that = this;
switch (_that) {
case _TimeLog() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String taskId,  String userId,  double hoursLogged,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeLog() when $default != null:
return $default(_that.id,_that.projectId,_that.taskId,_that.userId,_that.hoursLogged,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String taskId,  String userId,  double hoursLogged,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TimeLog():
return $default(_that.id,_that.projectId,_that.taskId,_that.userId,_that.hoursLogged,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String taskId,  String userId,  double hoursLogged,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TimeLog() when $default != null:
return $default(_that.id,_that.projectId,_that.taskId,_that.userId,_that.hoursLogged,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _TimeLog implements TimeLog {
  const _TimeLog({required this.id, required this.projectId, required this.taskId, required this.userId, required this.hoursLogged, this.description});
  

@override final  String id;
@override final  String projectId;
@override final  String taskId;
@override final  String userId;
@override final  double hoursLogged;
@override final  String? description;

/// Create a copy of TimeLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeLogCopyWith<_TimeLog> get copyWith => __$TimeLogCopyWithImpl<_TimeLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeLog&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.hoursLogged, hoursLogged) || other.hoursLogged == hoursLogged)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,projectId,taskId,userId,hoursLogged,description);

@override
String toString() {
  return 'TimeLog(id: $id, projectId: $projectId, taskId: $taskId, userId: $userId, hoursLogged: $hoursLogged, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TimeLogCopyWith<$Res> implements $TimeLogCopyWith<$Res> {
  factory _$TimeLogCopyWith(_TimeLog value, $Res Function(_TimeLog) _then) = __$TimeLogCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String taskId, String userId, double hoursLogged, String? description
});




}
/// @nodoc
class __$TimeLogCopyWithImpl<$Res>
    implements _$TimeLogCopyWith<$Res> {
  __$TimeLogCopyWithImpl(this._self, this._then);

  final _TimeLog _self;
  final $Res Function(_TimeLog) _then;

/// Create a copy of TimeLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? taskId = null,Object? userId = null,Object? hoursLogged = null,Object? description = freezed,}) {
  return _then(_TimeLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,hoursLogged: null == hoursLogged ? _self.hoursLogged : hoursLogged // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
