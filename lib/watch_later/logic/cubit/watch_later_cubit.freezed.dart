// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_later_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchLaterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchLaterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchLaterState()';
}


}

/// @nodoc
class $WatchLaterStateCopyWith<$Res>  {
$WatchLaterStateCopyWith(WatchLaterState _, $Res Function(WatchLaterState) __);
}


/// Adds pattern-matching-related methods to [WatchLaterState].
extension WatchLaterStatePatterns on WatchLaterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( WatchLaterLoading value)?  loading,TResult Function( WatchLaterSuccess value)?  success,TResult Function( WatchLaterFailure value)?  failure,TResult Function( WatchLaterEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case WatchLaterLoading() when loading != null:
return loading(_that);case WatchLaterSuccess() when success != null:
return success(_that);case WatchLaterFailure() when failure != null:
return failure(_that);case WatchLaterEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( WatchLaterLoading value)  loading,required TResult Function( WatchLaterSuccess value)  success,required TResult Function( WatchLaterFailure value)  failure,required TResult Function( WatchLaterEmpty value)  empty,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case WatchLaterLoading():
return loading(_that);case WatchLaterSuccess():
return success(_that);case WatchLaterFailure():
return failure(_that);case WatchLaterEmpty():
return empty(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( WatchLaterLoading value)?  loading,TResult? Function( WatchLaterSuccess value)?  success,TResult? Function( WatchLaterFailure value)?  failure,TResult? Function( WatchLaterEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case WatchLaterLoading() when loading != null:
return loading(_that);case WatchLaterSuccess() when success != null:
return success(_that);case WatchLaterFailure() when failure != null:
return failure(_that);case WatchLaterEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Movie> movies)?  success,TResult Function( ApiErrorModel error)?  failure,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case WatchLaterLoading() when loading != null:
return loading();case WatchLaterSuccess() when success != null:
return success(_that.movies);case WatchLaterFailure() when failure != null:
return failure(_that.error);case WatchLaterEmpty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Movie> movies)  success,required TResult Function( ApiErrorModel error)  failure,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case WatchLaterLoading():
return loading();case WatchLaterSuccess():
return success(_that.movies);case WatchLaterFailure():
return failure(_that.error);case WatchLaterEmpty():
return empty();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Movie> movies)?  success,TResult? Function( ApiErrorModel error)?  failure,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case WatchLaterLoading() when loading != null:
return loading();case WatchLaterSuccess() when success != null:
return success(_that.movies);case WatchLaterFailure() when failure != null:
return failure(_that.error);case WatchLaterEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements WatchLaterState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchLaterState.initial()';
}


}




/// @nodoc


class WatchLaterLoading implements WatchLaterState {
  const WatchLaterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchLaterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchLaterState.loading()';
}


}




/// @nodoc


class WatchLaterSuccess implements WatchLaterState {
  const WatchLaterSuccess(final  List<Movie> movies): _movies = movies;
  

 final  List<Movie> _movies;
 List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of WatchLaterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchLaterSuccessCopyWith<WatchLaterSuccess> get copyWith => _$WatchLaterSuccessCopyWithImpl<WatchLaterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchLaterSuccess&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'WatchLaterState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $WatchLaterSuccessCopyWith<$Res> implements $WatchLaterStateCopyWith<$Res> {
  factory $WatchLaterSuccessCopyWith(WatchLaterSuccess value, $Res Function(WatchLaterSuccess) _then) = _$WatchLaterSuccessCopyWithImpl;
@useResult
$Res call({
 List<Movie> movies
});




}
/// @nodoc
class _$WatchLaterSuccessCopyWithImpl<$Res>
    implements $WatchLaterSuccessCopyWith<$Res> {
  _$WatchLaterSuccessCopyWithImpl(this._self, this._then);

  final WatchLaterSuccess _self;
  final $Res Function(WatchLaterSuccess) _then;

/// Create a copy of WatchLaterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(WatchLaterSuccess(
null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

/// @nodoc


class WatchLaterFailure implements WatchLaterState {
  const WatchLaterFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of WatchLaterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchLaterFailureCopyWith<WatchLaterFailure> get copyWith => _$WatchLaterFailureCopyWithImpl<WatchLaterFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchLaterFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'WatchLaterState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $WatchLaterFailureCopyWith<$Res> implements $WatchLaterStateCopyWith<$Res> {
  factory $WatchLaterFailureCopyWith(WatchLaterFailure value, $Res Function(WatchLaterFailure) _then) = _$WatchLaterFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$WatchLaterFailureCopyWithImpl<$Res>
    implements $WatchLaterFailureCopyWith<$Res> {
  _$WatchLaterFailureCopyWithImpl(this._self, this._then);

  final WatchLaterFailure _self;
  final $Res Function(WatchLaterFailure) _then;

/// Create a copy of WatchLaterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(WatchLaterFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class WatchLaterEmpty implements WatchLaterState {
  const WatchLaterEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchLaterEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchLaterState.empty()';
}


}




// dart format on
