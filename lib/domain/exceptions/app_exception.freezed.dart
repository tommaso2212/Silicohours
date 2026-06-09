// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException()';
}


}

/// @nodoc
class $AppExceptionCopyWith<$Res>  {
$AppExceptionCopyWith(AppException _, $Res Function(AppException) __);
}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OperationAbortedException value)?  operationAborted,TResult Function( HttpException value)?  httpError,TResult Function( GenericException value)?  generic,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OperationAbortedException() when operationAborted != null:
return operationAborted(_that);case HttpException() when httpError != null:
return httpError(_that);case GenericException() when generic != null:
return generic(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OperationAbortedException value)  operationAborted,required TResult Function( HttpException value)  httpError,required TResult Function( GenericException value)  generic,}){
final _that = this;
switch (_that) {
case OperationAbortedException():
return operationAborted(_that);case HttpException():
return httpError(_that);case GenericException():
return generic(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OperationAbortedException value)?  operationAborted,TResult? Function( HttpException value)?  httpError,TResult? Function( GenericException value)?  generic,}){
final _that = this;
switch (_that) {
case OperationAbortedException() when operationAborted != null:
return operationAborted(_that);case HttpException() when httpError != null:
return httpError(_that);case GenericException() when generic != null:
return generic(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  operationAborted,TResult Function( int statusCode,  String? title,  String? message)?  httpError,TResult Function( String? title,  String? description,  Exception? e,  StackTrace? str)?  generic,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OperationAbortedException() when operationAborted != null:
return operationAborted();case HttpException() when httpError != null:
return httpError(_that.statusCode,_that.title,_that.message);case GenericException() when generic != null:
return generic(_that.title,_that.description,_that.e,_that.str);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  operationAborted,required TResult Function( int statusCode,  String? title,  String? message)  httpError,required TResult Function( String? title,  String? description,  Exception? e,  StackTrace? str)  generic,}) {final _that = this;
switch (_that) {
case OperationAbortedException():
return operationAborted();case HttpException():
return httpError(_that.statusCode,_that.title,_that.message);case GenericException():
return generic(_that.title,_that.description,_that.e,_that.str);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  operationAborted,TResult? Function( int statusCode,  String? title,  String? message)?  httpError,TResult? Function( String? title,  String? description,  Exception? e,  StackTrace? str)?  generic,}) {final _that = this;
switch (_that) {
case OperationAbortedException() when operationAborted != null:
return operationAborted();case HttpException() when httpError != null:
return httpError(_that.statusCode,_that.title,_that.message);case GenericException() when generic != null:
return generic(_that.title,_that.description,_that.e,_that.str);case _:
  return null;

}
}

}

/// @nodoc


class OperationAbortedException implements AppException {
  const OperationAbortedException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationAbortedException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.operationAborted()';
}


}




/// @nodoc


class HttpException implements AppException {
  const HttpException({required this.statusCode, this.title, this.message});
  

 final  int statusCode;
 final  String? title;
 final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpExceptionCopyWith<HttpException> get copyWith => _$HttpExceptionCopyWithImpl<HttpException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpException&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,title,message);

@override
String toString() {
  return 'AppException.httpError(statusCode: $statusCode, title: $title, message: $message)';
}


}

/// @nodoc
abstract mixin class $HttpExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $HttpExceptionCopyWith(HttpException value, $Res Function(HttpException) _then) = _$HttpExceptionCopyWithImpl;
@useResult
$Res call({
 int statusCode, String? title, String? message
});




}
/// @nodoc
class _$HttpExceptionCopyWithImpl<$Res>
    implements $HttpExceptionCopyWith<$Res> {
  _$HttpExceptionCopyWithImpl(this._self, this._then);

  final HttpException _self;
  final $Res Function(HttpException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? title = freezed,Object? message = freezed,}) {
  return _then(HttpException(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class GenericException implements AppException {
  const GenericException({this.title, this.description, this.e, this.str});
  

 final  String? title;
 final  String? description;
 final  Exception? e;
 final  StackTrace? str;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericExceptionCopyWith<GenericException> get copyWith => _$GenericExceptionCopyWithImpl<GenericException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericException&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.e, e) || other.e == e)&&(identical(other.str, str) || other.str == str));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,e,str);

@override
String toString() {
  return 'AppException.generic(title: $title, description: $description, e: $e, str: $str)';
}


}

/// @nodoc
abstract mixin class $GenericExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $GenericExceptionCopyWith(GenericException value, $Res Function(GenericException) _then) = _$GenericExceptionCopyWithImpl;
@useResult
$Res call({
 String? title, String? description, Exception? e, StackTrace? str
});




}
/// @nodoc
class _$GenericExceptionCopyWithImpl<$Res>
    implements $GenericExceptionCopyWith<$Res> {
  _$GenericExceptionCopyWithImpl(this._self, this._then);

  final GenericException _self;
  final $Res Function(GenericException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? e = freezed,Object? str = freezed,}) {
  return _then(GenericException(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,e: freezed == e ? _self.e : e // ignore: cast_nullable_to_non_nullable
as Exception?,str: freezed == str ? _self.str : str // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
