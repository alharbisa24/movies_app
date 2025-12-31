// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_movies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpcomingMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpcomingMoviesState()';
}


}

/// @nodoc
class $UpcomingMoviesStateCopyWith<$Res>  {
$UpcomingMoviesStateCopyWith(UpcomingMoviesState _, $Res Function(UpcomingMoviesState) __);
}


/// Adds pattern-matching-related methods to [UpcomingMoviesState].
extension UpcomingMoviesStatePatterns on UpcomingMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( UpcomingMoviesLoading value)?  loading,TResult Function( UpcomingMoviesSuccess value)?  success,TResult Function( UpcomingMoviesFailure value)?  failure,TResult Function( UpcomingMoviesGenresSuccess value)?  genresSuccess,TResult Function( UpcomingMoviesGenresFailure value)?  genresFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpcomingMoviesLoading() when loading != null:
return loading(_that);case UpcomingMoviesSuccess() when success != null:
return success(_that);case UpcomingMoviesFailure() when failure != null:
return failure(_that);case UpcomingMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case UpcomingMoviesGenresFailure() when genresFailure != null:
return genresFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( UpcomingMoviesLoading value)  loading,required TResult Function( UpcomingMoviesSuccess value)  success,required TResult Function( UpcomingMoviesFailure value)  failure,required TResult Function( UpcomingMoviesGenresSuccess value)  genresSuccess,required TResult Function( UpcomingMoviesGenresFailure value)  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case UpcomingMoviesLoading():
return loading(_that);case UpcomingMoviesSuccess():
return success(_that);case UpcomingMoviesFailure():
return failure(_that);case UpcomingMoviesGenresSuccess():
return genresSuccess(_that);case UpcomingMoviesGenresFailure():
return genresFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( UpcomingMoviesLoading value)?  loading,TResult? Function( UpcomingMoviesSuccess value)?  success,TResult? Function( UpcomingMoviesFailure value)?  failure,TResult? Function( UpcomingMoviesGenresSuccess value)?  genresSuccess,TResult? Function( UpcomingMoviesGenresFailure value)?  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpcomingMoviesLoading() when loading != null:
return loading(_that);case UpcomingMoviesSuccess() when success != null:
return success(_that);case UpcomingMoviesFailure() when failure != null:
return failure(_that);case UpcomingMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case UpcomingMoviesGenresFailure() when genresFailure != null:
return genresFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Movie?> movies)?  success,TResult Function( ApiErrorModel error)?  failure,TResult Function( List<Genre> genresList)?  genresSuccess,TResult Function()?  genresFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpcomingMoviesLoading() when loading != null:
return loading();case UpcomingMoviesSuccess() when success != null:
return success(_that.movies);case UpcomingMoviesFailure() when failure != null:
return failure(_that.error);case UpcomingMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case UpcomingMoviesGenresFailure() when genresFailure != null:
return genresFailure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Movie?> movies)  success,required TResult Function( ApiErrorModel error)  failure,required TResult Function( List<Genre> genresList)  genresSuccess,required TResult Function()  genresFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case UpcomingMoviesLoading():
return loading();case UpcomingMoviesSuccess():
return success(_that.movies);case UpcomingMoviesFailure():
return failure(_that.error);case UpcomingMoviesGenresSuccess():
return genresSuccess(_that.genresList);case UpcomingMoviesGenresFailure():
return genresFailure();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Movie?> movies)?  success,TResult? Function( ApiErrorModel error)?  failure,TResult? Function( List<Genre> genresList)?  genresSuccess,TResult? Function()?  genresFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpcomingMoviesLoading() when loading != null:
return loading();case UpcomingMoviesSuccess() when success != null:
return success(_that.movies);case UpcomingMoviesFailure() when failure != null:
return failure(_that.error);case UpcomingMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case UpcomingMoviesGenresFailure() when genresFailure != null:
return genresFailure();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UpcomingMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpcomingMoviesState.initial()';
}


}




/// @nodoc


class UpcomingMoviesLoading implements UpcomingMoviesState {
  const UpcomingMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpcomingMoviesState.loading()';
}


}




/// @nodoc


class UpcomingMoviesSuccess implements UpcomingMoviesState {
  const UpcomingMoviesSuccess(final  List<Movie?> movies): _movies = movies;
  

 final  List<Movie?> _movies;
 List<Movie?> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpcomingMoviesSuccessCopyWith<UpcomingMoviesSuccess> get copyWith => _$UpcomingMoviesSuccessCopyWithImpl<UpcomingMoviesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingMoviesSuccess&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'UpcomingMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $UpcomingMoviesSuccessCopyWith<$Res> implements $UpcomingMoviesStateCopyWith<$Res> {
  factory $UpcomingMoviesSuccessCopyWith(UpcomingMoviesSuccess value, $Res Function(UpcomingMoviesSuccess) _then) = _$UpcomingMoviesSuccessCopyWithImpl;
@useResult
$Res call({
 List<Movie?> movies
});




}
/// @nodoc
class _$UpcomingMoviesSuccessCopyWithImpl<$Res>
    implements $UpcomingMoviesSuccessCopyWith<$Res> {
  _$UpcomingMoviesSuccessCopyWithImpl(this._self, this._then);

  final UpcomingMoviesSuccess _self;
  final $Res Function(UpcomingMoviesSuccess) _then;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(UpcomingMoviesSuccess(
null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie?>,
  ));
}


}

/// @nodoc


class UpcomingMoviesFailure implements UpcomingMoviesState {
  const UpcomingMoviesFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpcomingMoviesFailureCopyWith<UpcomingMoviesFailure> get copyWith => _$UpcomingMoviesFailureCopyWithImpl<UpcomingMoviesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingMoviesFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UpcomingMoviesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $UpcomingMoviesFailureCopyWith<$Res> implements $UpcomingMoviesStateCopyWith<$Res> {
  factory $UpcomingMoviesFailureCopyWith(UpcomingMoviesFailure value, $Res Function(UpcomingMoviesFailure) _then) = _$UpcomingMoviesFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$UpcomingMoviesFailureCopyWithImpl<$Res>
    implements $UpcomingMoviesFailureCopyWith<$Res> {
  _$UpcomingMoviesFailureCopyWithImpl(this._self, this._then);

  final UpcomingMoviesFailure _self;
  final $Res Function(UpcomingMoviesFailure) _then;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(UpcomingMoviesFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class UpcomingMoviesGenresSuccess implements UpcomingMoviesState {
  const UpcomingMoviesGenresSuccess(final  List<Genre> genresList): _genresList = genresList;
  

 final  List<Genre> _genresList;
 List<Genre> get genresList {
  if (_genresList is EqualUnmodifiableListView) return _genresList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genresList);
}


/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpcomingMoviesGenresSuccessCopyWith<UpcomingMoviesGenresSuccess> get copyWith => _$UpcomingMoviesGenresSuccessCopyWithImpl<UpcomingMoviesGenresSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingMoviesGenresSuccess&&const DeepCollectionEquality().equals(other._genresList, _genresList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genresList));

@override
String toString() {
  return 'UpcomingMoviesState.genresSuccess(genresList: $genresList)';
}


}

/// @nodoc
abstract mixin class $UpcomingMoviesGenresSuccessCopyWith<$Res> implements $UpcomingMoviesStateCopyWith<$Res> {
  factory $UpcomingMoviesGenresSuccessCopyWith(UpcomingMoviesGenresSuccess value, $Res Function(UpcomingMoviesGenresSuccess) _then) = _$UpcomingMoviesGenresSuccessCopyWithImpl;
@useResult
$Res call({
 List<Genre> genresList
});




}
/// @nodoc
class _$UpcomingMoviesGenresSuccessCopyWithImpl<$Res>
    implements $UpcomingMoviesGenresSuccessCopyWith<$Res> {
  _$UpcomingMoviesGenresSuccessCopyWithImpl(this._self, this._then);

  final UpcomingMoviesGenresSuccess _self;
  final $Res Function(UpcomingMoviesGenresSuccess) _then;

/// Create a copy of UpcomingMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genresList = null,}) {
  return _then(UpcomingMoviesGenresSuccess(
null == genresList ? _self._genresList : genresList // ignore: cast_nullable_to_non_nullable
as List<Genre>,
  ));
}


}

/// @nodoc


class UpcomingMoviesGenresFailure implements UpcomingMoviesState {
  const UpcomingMoviesGenresFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingMoviesGenresFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpcomingMoviesState.genresFailure()';
}


}




// dart format on
