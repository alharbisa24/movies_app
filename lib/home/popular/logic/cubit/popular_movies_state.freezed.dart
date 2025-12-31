// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopularMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMoviesState()';
}


}

/// @nodoc
class $PopularMoviesStateCopyWith<$Res>  {
$PopularMoviesStateCopyWith(PopularMoviesState _, $Res Function(PopularMoviesState) __);
}


/// Adds pattern-matching-related methods to [PopularMoviesState].
extension PopularMoviesStatePatterns on PopularMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PopularMoviesLoading value)?  loading,TResult Function( PopularMoviesSuccess value)?  success,TResult Function( PopularMoviesFailure value)?  failure,TResult Function( PopularMoviesGenresSuccess value)?  genresSuccess,TResult Function( PopularMoviesGenresFailure value)?  genresFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PopularMoviesLoading() when loading != null:
return loading(_that);case PopularMoviesSuccess() when success != null:
return success(_that);case PopularMoviesFailure() when failure != null:
return failure(_that);case PopularMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case PopularMoviesGenresFailure() when genresFailure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PopularMoviesLoading value)  loading,required TResult Function( PopularMoviesSuccess value)  success,required TResult Function( PopularMoviesFailure value)  failure,required TResult Function( PopularMoviesGenresSuccess value)  genresSuccess,required TResult Function( PopularMoviesGenresFailure value)  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PopularMoviesLoading():
return loading(_that);case PopularMoviesSuccess():
return success(_that);case PopularMoviesFailure():
return failure(_that);case PopularMoviesGenresSuccess():
return genresSuccess(_that);case PopularMoviesGenresFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PopularMoviesLoading value)?  loading,TResult? Function( PopularMoviesSuccess value)?  success,TResult? Function( PopularMoviesFailure value)?  failure,TResult? Function( PopularMoviesGenresSuccess value)?  genresSuccess,TResult? Function( PopularMoviesGenresFailure value)?  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PopularMoviesLoading() when loading != null:
return loading(_that);case PopularMoviesSuccess() when success != null:
return success(_that);case PopularMoviesFailure() when failure != null:
return failure(_that);case PopularMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case PopularMoviesGenresFailure() when genresFailure != null:
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
return initial();case PopularMoviesLoading() when loading != null:
return loading();case PopularMoviesSuccess() when success != null:
return success(_that.movies);case PopularMoviesFailure() when failure != null:
return failure(_that.error);case PopularMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case PopularMoviesGenresFailure() when genresFailure != null:
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
return initial();case PopularMoviesLoading():
return loading();case PopularMoviesSuccess():
return success(_that.movies);case PopularMoviesFailure():
return failure(_that.error);case PopularMoviesGenresSuccess():
return genresSuccess(_that.genresList);case PopularMoviesGenresFailure():
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
return initial();case PopularMoviesLoading() when loading != null:
return loading();case PopularMoviesSuccess() when success != null:
return success(_that.movies);case PopularMoviesFailure() when failure != null:
return failure(_that.error);case PopularMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case PopularMoviesGenresFailure() when genresFailure != null:
return genresFailure();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PopularMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMoviesState.initial()';
}


}




/// @nodoc


class PopularMoviesLoading implements PopularMoviesState {
  const PopularMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMoviesState.loading()';
}


}




/// @nodoc


class PopularMoviesSuccess implements PopularMoviesState {
  const PopularMoviesSuccess(final  List<Movie?> movies): _movies = movies;
  

 final  List<Movie?> _movies;
 List<Movie?> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularMoviesSuccessCopyWith<PopularMoviesSuccess> get copyWith => _$PopularMoviesSuccessCopyWithImpl<PopularMoviesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesSuccess&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'PopularMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $PopularMoviesSuccessCopyWith<$Res> implements $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesSuccessCopyWith(PopularMoviesSuccess value, $Res Function(PopularMoviesSuccess) _then) = _$PopularMoviesSuccessCopyWithImpl;
@useResult
$Res call({
 List<Movie?> movies
});




}
/// @nodoc
class _$PopularMoviesSuccessCopyWithImpl<$Res>
    implements $PopularMoviesSuccessCopyWith<$Res> {
  _$PopularMoviesSuccessCopyWithImpl(this._self, this._then);

  final PopularMoviesSuccess _self;
  final $Res Function(PopularMoviesSuccess) _then;

/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(PopularMoviesSuccess(
null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie?>,
  ));
}


}

/// @nodoc


class PopularMoviesFailure implements PopularMoviesState {
  const PopularMoviesFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularMoviesFailureCopyWith<PopularMoviesFailure> get copyWith => _$PopularMoviesFailureCopyWithImpl<PopularMoviesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PopularMoviesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PopularMoviesFailureCopyWith<$Res> implements $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesFailureCopyWith(PopularMoviesFailure value, $Res Function(PopularMoviesFailure) _then) = _$PopularMoviesFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$PopularMoviesFailureCopyWithImpl<$Res>
    implements $PopularMoviesFailureCopyWith<$Res> {
  _$PopularMoviesFailureCopyWithImpl(this._self, this._then);

  final PopularMoviesFailure _self;
  final $Res Function(PopularMoviesFailure) _then;

/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PopularMoviesFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class PopularMoviesGenresSuccess implements PopularMoviesState {
  const PopularMoviesGenresSuccess(final  List<Genre> genresList): _genresList = genresList;
  

 final  List<Genre> _genresList;
 List<Genre> get genresList {
  if (_genresList is EqualUnmodifiableListView) return _genresList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genresList);
}


/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularMoviesGenresSuccessCopyWith<PopularMoviesGenresSuccess> get copyWith => _$PopularMoviesGenresSuccessCopyWithImpl<PopularMoviesGenresSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesGenresSuccess&&const DeepCollectionEquality().equals(other._genresList, _genresList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genresList));

@override
String toString() {
  return 'PopularMoviesState.genresSuccess(genresList: $genresList)';
}


}

/// @nodoc
abstract mixin class $PopularMoviesGenresSuccessCopyWith<$Res> implements $PopularMoviesStateCopyWith<$Res> {
  factory $PopularMoviesGenresSuccessCopyWith(PopularMoviesGenresSuccess value, $Res Function(PopularMoviesGenresSuccess) _then) = _$PopularMoviesGenresSuccessCopyWithImpl;
@useResult
$Res call({
 List<Genre> genresList
});




}
/// @nodoc
class _$PopularMoviesGenresSuccessCopyWithImpl<$Res>
    implements $PopularMoviesGenresSuccessCopyWith<$Res> {
  _$PopularMoviesGenresSuccessCopyWithImpl(this._self, this._then);

  final PopularMoviesGenresSuccess _self;
  final $Res Function(PopularMoviesGenresSuccess) _then;

/// Create a copy of PopularMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genresList = null,}) {
  return _then(PopularMoviesGenresSuccess(
null == genresList ? _self._genresList : genresList // ignore: cast_nullable_to_non_nullable
as List<Genre>,
  ));
}


}

/// @nodoc


class PopularMoviesGenresFailure implements PopularMoviesState {
  const PopularMoviesGenresFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularMoviesGenresFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopularMoviesState.genresFailure()';
}


}




// dart format on
