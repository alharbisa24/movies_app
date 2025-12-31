// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SearchLoading value)?  loading,TResult Function( SearchSuccess value)?  success,TResult Function( SearchFailure value)?  failure,TResult Function( SearchLoadingMore value)?  loadingMore,TResult Function( SearchGenresSuccess value)?  genresSuccess,TResult Function( SearchGenresFailure value)?  genresFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchSuccess() when success != null:
return success(_that);case SearchFailure() when failure != null:
return failure(_that);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that);case SearchGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case SearchGenresFailure() when genresFailure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SearchLoading value)  loading,required TResult Function( SearchSuccess value)  success,required TResult Function( SearchFailure value)  failure,required TResult Function( SearchLoadingMore value)  loadingMore,required TResult Function( SearchGenresSuccess value)  genresSuccess,required TResult Function( SearchGenresFailure value)  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SearchLoading():
return loading(_that);case SearchSuccess():
return success(_that);case SearchFailure():
return failure(_that);case SearchLoadingMore():
return loadingMore(_that);case SearchGenresSuccess():
return genresSuccess(_that);case SearchGenresFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SearchLoading value)?  loading,TResult? Function( SearchSuccess value)?  success,TResult? Function( SearchFailure value)?  failure,TResult? Function( SearchLoadingMore value)?  loadingMore,TResult? Function( SearchGenresSuccess value)?  genresSuccess,TResult? Function( SearchGenresFailure value)?  genresFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchSuccess() when success != null:
return success(_that);case SearchFailure() when failure != null:
return failure(_that);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that);case SearchGenresSuccess() when genresSuccess != null:
return genresSuccess(_that);case SearchGenresFailure() when genresFailure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Movie?> movies)?  success,TResult Function( ApiErrorModel error)?  failure,TResult Function( List<Movie?> movies)?  loadingMore,TResult Function( List<Genre> genresList)?  genresSuccess,TResult Function()?  genresFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SearchLoading() when loading != null:
return loading();case SearchSuccess() when success != null:
return success(_that.movies);case SearchFailure() when failure != null:
return failure(_that.error);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that.movies);case SearchGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case SearchGenresFailure() when genresFailure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Movie?> movies)  success,required TResult Function( ApiErrorModel error)  failure,required TResult Function( List<Movie?> movies)  loadingMore,required TResult Function( List<Genre> genresList)  genresSuccess,required TResult Function()  genresFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SearchLoading():
return loading();case SearchSuccess():
return success(_that.movies);case SearchFailure():
return failure(_that.error);case SearchLoadingMore():
return loadingMore(_that.movies);case SearchGenresSuccess():
return genresSuccess(_that.genresList);case SearchGenresFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Movie?> movies)?  success,TResult? Function( ApiErrorModel error)?  failure,TResult? Function( List<Movie?> movies)?  loadingMore,TResult? Function( List<Genre> genresList)?  genresSuccess,TResult? Function()?  genresFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SearchLoading() when loading != null:
return loading();case SearchSuccess() when success != null:
return success(_that.movies);case SearchFailure() when failure != null:
return failure(_that.error);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that.movies);case SearchGenresSuccess() when genresSuccess != null:
return genresSuccess(_that.genresList);case SearchGenresFailure() when genresFailure != null:
return genresFailure();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SearchState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.initial()';
}


}




/// @nodoc


class SearchLoading implements SearchState {
  const SearchLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.loading()';
}


}




/// @nodoc


class SearchSuccess implements SearchState {
  const SearchSuccess(final  List<Movie?> movies): _movies = movies;
  

 final  List<Movie?> _movies;
 List<Movie?> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuccessCopyWith<SearchSuccess> get copyWith => _$SearchSuccessCopyWithImpl<SearchSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuccess&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'SearchState.success(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $SearchSuccessCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchSuccessCopyWith(SearchSuccess value, $Res Function(SearchSuccess) _then) = _$SearchSuccessCopyWithImpl;
@useResult
$Res call({
 List<Movie?> movies
});




}
/// @nodoc
class _$SearchSuccessCopyWithImpl<$Res>
    implements $SearchSuccessCopyWith<$Res> {
  _$SearchSuccessCopyWithImpl(this._self, this._then);

  final SearchSuccess _self;
  final $Res Function(SearchSuccess) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(SearchSuccess(
null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie?>,
  ));
}


}

/// @nodoc


class SearchFailure implements SearchState {
  const SearchFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFailureCopyWith<SearchFailure> get copyWith => _$SearchFailureCopyWithImpl<SearchFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SearchState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SearchFailureCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchFailureCopyWith(SearchFailure value, $Res Function(SearchFailure) _then) = _$SearchFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$SearchFailureCopyWithImpl<$Res>
    implements $SearchFailureCopyWith<$Res> {
  _$SearchFailureCopyWithImpl(this._self, this._then);

  final SearchFailure _self;
  final $Res Function(SearchFailure) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SearchFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class SearchLoadingMore implements SearchState {
  const SearchLoadingMore(final  List<Movie?> movies): _movies = movies;
  

 final  List<Movie?> _movies;
 List<Movie?> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchLoadingMoreCopyWith<SearchLoadingMore> get copyWith => _$SearchLoadingMoreCopyWithImpl<SearchLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoadingMore&&const DeepCollectionEquality().equals(other._movies, _movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies));

@override
String toString() {
  return 'SearchState.loadingMore(movies: $movies)';
}


}

/// @nodoc
abstract mixin class $SearchLoadingMoreCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchLoadingMoreCopyWith(SearchLoadingMore value, $Res Function(SearchLoadingMore) _then) = _$SearchLoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<Movie?> movies
});




}
/// @nodoc
class _$SearchLoadingMoreCopyWithImpl<$Res>
    implements $SearchLoadingMoreCopyWith<$Res> {
  _$SearchLoadingMoreCopyWithImpl(this._self, this._then);

  final SearchLoadingMore _self;
  final $Res Function(SearchLoadingMore) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(SearchLoadingMore(
null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie?>,
  ));
}


}

/// @nodoc


class SearchGenresSuccess implements SearchState {
  const SearchGenresSuccess(final  List<Genre> genresList): _genresList = genresList;
  

 final  List<Genre> _genresList;
 List<Genre> get genresList {
  if (_genresList is EqualUnmodifiableListView) return _genresList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genresList);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchGenresSuccessCopyWith<SearchGenresSuccess> get copyWith => _$SearchGenresSuccessCopyWithImpl<SearchGenresSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchGenresSuccess&&const DeepCollectionEquality().equals(other._genresList, _genresList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genresList));

@override
String toString() {
  return 'SearchState.genresSuccess(genresList: $genresList)';
}


}

/// @nodoc
abstract mixin class $SearchGenresSuccessCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchGenresSuccessCopyWith(SearchGenresSuccess value, $Res Function(SearchGenresSuccess) _then) = _$SearchGenresSuccessCopyWithImpl;
@useResult
$Res call({
 List<Genre> genresList
});




}
/// @nodoc
class _$SearchGenresSuccessCopyWithImpl<$Res>
    implements $SearchGenresSuccessCopyWith<$Res> {
  _$SearchGenresSuccessCopyWithImpl(this._self, this._then);

  final SearchGenresSuccess _self;
  final $Res Function(SearchGenresSuccess) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genresList = null,}) {
  return _then(SearchGenresSuccess(
null == genresList ? _self._genresList : genresList // ignore: cast_nullable_to_non_nullable
as List<Genre>,
  ));
}


}

/// @nodoc


class SearchGenresFailure implements SearchState {
  const SearchGenresFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchGenresFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.genresFailure()';
}


}




// dart format on
