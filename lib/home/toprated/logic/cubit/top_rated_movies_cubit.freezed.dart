// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_movies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopRatedMoviesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState()';
}


}

/// @nodoc
class $TopRatedMoviesStateCopyWith<$Res>  {
$TopRatedMoviesStateCopyWith(TopRatedMoviesState _, $Res Function(TopRatedMoviesState) __);
}


/// Adds pattern-matching-related methods to [TopRatedMoviesState].
extension TopRatedMoviesStatePatterns on TopRatedMoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( TopRatedMoviesLoading value)?  loading,TResult Function( TopRatedMoviesSuccess value)?  success,TResult Function( TopRatedMoviesFailure value)?  failure,TResult Function( TopRatedMoviesGenresSuccess value)?  genresSuccess,TResult Function( TopRatedMoviesGenresFailure value)?  genresFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case TopRatedMoviesLoading() when loading != null:
return loading(_that);case TopRatedMoviesSuccess() when success != null:
return success(_that);case TopRatedMoviesFailure() when failure != null:
return failure(_that);case TopRatedMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case TopRatedMoviesGenresFailure() when genresFailure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( TopRatedMoviesLoading value)  loading,required TResult Function( TopRatedMoviesSuccess value)  success,required TResult Function( TopRatedMoviesFailure value)  failure,required TResult Function( TopRatedMoviesGenresSuccess value)  genresSuccess,required TResult Function( TopRatedMoviesGenresFailure value)  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case TopRatedMoviesLoading():
return loading(_that);case TopRatedMoviesSuccess():
return success(_that);case TopRatedMoviesFailure():
return failure(_that);case TopRatedMoviesGenresSuccess():
return genresSuccess(_that);case TopRatedMoviesGenresFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( TopRatedMoviesLoading value)?  loading,TResult? Function( TopRatedMoviesSuccess value)?  success,TResult? Function( TopRatedMoviesFailure value)?  failure,TResult? Function( TopRatedMoviesGenresSuccess value)?  genresSuccess,TResult? Function( TopRatedMoviesGenresFailure value)?  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case TopRatedMoviesLoading() when loading != null:
return loading(_that);case TopRatedMoviesSuccess() when success != null:
return success(_that);case TopRatedMoviesFailure() when failure != null:
return failure(_that);case TopRatedMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case TopRatedMoviesGenresFailure() when genresFailure != null:
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
return initial();case TopRatedMoviesLoading() when loading != null:
return loading();case TopRatedMoviesSuccess() when success != null:
return success(_that.movies);case TopRatedMoviesFailure() when failure != null:
return failure(_that.error);case TopRatedMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case TopRatedMoviesGenresFailure() when genresFailure != null:
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
return initial();case TopRatedMoviesLoading():
return loading();case TopRatedMoviesSuccess():
return success(_that.movies);case TopRatedMoviesFailure():
return failure(_that.error);case TopRatedMoviesGenresSuccess():
return genresSuccess(_that.genresList);case TopRatedMoviesGenresFailure():
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
return initial();case TopRatedMoviesLoading() when loading != null:
return loading();case TopRatedMoviesSuccess() when success != null:
return success(_that.movies);case TopRatedMoviesFailure() when failure != null:
return failure(_that.error);case TopRatedMoviesGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case TopRatedMoviesGenresFailure() when genresFailure != null:
return genresFailure();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TopRatedMoviesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState.initial()';
}


}




/// @nodoc


class TopRatedMoviesLoading implements TopRatedMoviesState {
  const TopRatedMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState.loading()';
}


}




/// @nodoc


class TopRatedMoviesSuccess implements TopRatedMoviesState {
  const TopRatedMoviesSuccess(final  List<Movie?> movies): _movies = movies;
  

 final  List<Movie?> _movies;
 List<Movie?> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedMoviesSuccessCopyWith<TopRatedMoviesSuccess> get copyWith => _$TopRatedMoviesSuccessCopyWithImpl<TopRatedMoviesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesSuccess&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'TopRatedMoviesState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $TopRatedMoviesSuccessCopyWith<$Res> implements $TopRatedMoviesStateCopyWith<$Res> {
  factory $TopRatedMoviesSuccessCopyWith(TopRatedMoviesSuccess value, $Res Function(TopRatedMoviesSuccess) _then) = _$TopRatedMoviesSuccessCopyWithImpl;
@useResult
$Res call({
 List<Movie?> movies
});




}
/// @nodoc
class _$TopRatedMoviesSuccessCopyWithImpl<$Res>
    implements $TopRatedMoviesSuccessCopyWith<$Res> {
  _$TopRatedMoviesSuccessCopyWithImpl(this._self, this._then);

  final TopRatedMoviesSuccess _self;
  final $Res Function(TopRatedMoviesSuccess) _then;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(TopRatedMoviesSuccess(
null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie?>,
  ));
}


}

/// @nodoc


class TopRatedMoviesFailure implements TopRatedMoviesState {
  const TopRatedMoviesFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedMoviesFailureCopyWith<TopRatedMoviesFailure> get copyWith => _$TopRatedMoviesFailureCopyWithImpl<TopRatedMoviesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TopRatedMoviesState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $TopRatedMoviesFailureCopyWith<$Res> implements $TopRatedMoviesStateCopyWith<$Res> {
  factory $TopRatedMoviesFailureCopyWith(TopRatedMoviesFailure value, $Res Function(TopRatedMoviesFailure) _then) = _$TopRatedMoviesFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$TopRatedMoviesFailureCopyWithImpl<$Res>
    implements $TopRatedMoviesFailureCopyWith<$Res> {
  _$TopRatedMoviesFailureCopyWithImpl(this._self, this._then);

  final TopRatedMoviesFailure _self;
  final $Res Function(TopRatedMoviesFailure) _then;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(TopRatedMoviesFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class TopRatedMoviesGenresSuccess implements TopRatedMoviesState {
  const TopRatedMoviesGenresSuccess(final  List<Genre> genresList): _genresList = genresList;
  

 final  List<Genre> _genresList;
 List<Genre> get genresList {
  if (_genresList is EqualUnmodifiableListView) return _genresList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genresList);
}


/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopRatedMoviesGenresSuccessCopyWith<TopRatedMoviesGenresSuccess> get copyWith => _$TopRatedMoviesGenresSuccessCopyWithImpl<TopRatedMoviesGenresSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesGenresSuccess&&const DeepCollectionEquality().equals(other._genresList, _genresList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genresList));

@override
String toString() {
  return 'TopRatedMoviesState.genresSuccess(genresList: $genresList)';
}


}

/// @nodoc
abstract mixin class $TopRatedMoviesGenresSuccessCopyWith<$Res> implements $TopRatedMoviesStateCopyWith<$Res> {
  factory $TopRatedMoviesGenresSuccessCopyWith(TopRatedMoviesGenresSuccess value, $Res Function(TopRatedMoviesGenresSuccess) _then) = _$TopRatedMoviesGenresSuccessCopyWithImpl;
@useResult
$Res call({
 List<Genre> genresList
});




}
/// @nodoc
class _$TopRatedMoviesGenresSuccessCopyWithImpl<$Res>
    implements $TopRatedMoviesGenresSuccessCopyWith<$Res> {
  _$TopRatedMoviesGenresSuccessCopyWithImpl(this._self, this._then);

  final TopRatedMoviesGenresSuccess _self;
  final $Res Function(TopRatedMoviesGenresSuccess) _then;

/// Create a copy of TopRatedMoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genresList = null,}) {
  return _then(TopRatedMoviesGenresSuccess(
null == genresList ? _self._genresList : genresList // ignore: cast_nullable_to_non_nullable
as List<Genre>,
  ));
}


}

/// @nodoc


class TopRatedMoviesGenresFailure implements TopRatedMoviesState {
  const TopRatedMoviesGenresFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopRatedMoviesGenresFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopRatedMoviesState.genresFailure()';
}


}




// dart format on
