part of 'top_rated_movies_cubit.dart';

@freezed
class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState.initial() = _Initial;

const factory TopRatedMoviesState.loading() = TopRatedMoviesLoading;
const factory TopRatedMoviesState.success(List<Movie?> movies) = TopRatedMoviesSuccess;
const factory TopRatedMoviesState.failure(ApiErrorModel error) = TopRatedMoviesFailure;

const factory TopRatedMoviesState.genresSuccess(List<Genre> genresList)= TopRatedMoviesGenresSuccess;
const factory TopRatedMoviesState.genresFailure() = TopRatedMoviesGenresFailure;
}
