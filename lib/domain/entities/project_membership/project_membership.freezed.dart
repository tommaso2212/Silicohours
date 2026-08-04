// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_membership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectMembership {

 String get id; String get projectId; String get userId;
/// Create a copy of ProjectMembership
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectMembershipCopyWith<ProjectMembership> get copyWith => _$ProjectMembershipCopyWithImpl<ProjectMembership>(this as ProjectMembership, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectMembership&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,projectId,userId);

@override
String toString() {
  return 'ProjectMembership(id: $id, projectId: $projectId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ProjectMembershipCopyWith<$Res>  {
  factory $ProjectMembershipCopyWith(ProjectMembership value, $Res Function(ProjectMembership) _then) = _$ProjectMembershipCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String userId
});




}
/// @nodoc
class _$ProjectMembershipCopyWithImpl<$Res>
    implements $ProjectMembershipCopyWith<$Res> {
  _$ProjectMembershipCopyWithImpl(this._self, this._then);

  final ProjectMembership _self;
  final $Res Function(ProjectMembership) _then;

/// Create a copy of ProjectMembership
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectMembership].
extension ProjectMembershipPatterns on ProjectMembership {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectMembership value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectMembership() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectMembership value)  $default,){
final _that = this;
switch (_that) {
case _ProjectMembership():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectMembership value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectMembership() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectMembership() when $default != null:
return $default(_that.id,_that.projectId,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String userId)  $default,) {final _that = this;
switch (_that) {
case _ProjectMembership():
return $default(_that.id,_that.projectId,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String userId)?  $default,) {final _that = this;
switch (_that) {
case _ProjectMembership() when $default != null:
return $default(_that.id,_that.projectId,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectMembership implements ProjectMembership {
  const _ProjectMembership({required this.id, required this.projectId, required this.userId});
  

@override final  String id;
@override final  String projectId;
@override final  String userId;

/// Create a copy of ProjectMembership
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectMembershipCopyWith<_ProjectMembership> get copyWith => __$ProjectMembershipCopyWithImpl<_ProjectMembership>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectMembership&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,projectId,userId);

@override
String toString() {
  return 'ProjectMembership(id: $id, projectId: $projectId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ProjectMembershipCopyWith<$Res> implements $ProjectMembershipCopyWith<$Res> {
  factory _$ProjectMembershipCopyWith(_ProjectMembership value, $Res Function(_ProjectMembership) _then) = __$ProjectMembershipCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String userId
});




}
/// @nodoc
class __$ProjectMembershipCopyWithImpl<$Res>
    implements _$ProjectMembershipCopyWith<$Res> {
  __$ProjectMembershipCopyWithImpl(this._self, this._then);

  final _ProjectMembership _self;
  final $Res Function(_ProjectMembership) _then;

/// Create a copy of ProjectMembership
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? userId = null,}) {
  return _then(_ProjectMembership(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
