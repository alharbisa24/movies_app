part of 'upcoming_movies_cubit.dart';

@freezed
class UpcomingMoviesState with _$UpcomingMoviesState {
  const factory UpcomingMoviesState.initial() = _Initial;

const factory UpcomingMoviesState.loading() = UpcomingMoviesLoading;
const factory UpcomingMoviesState.success(List<Movie?> movies) = UpcomingMoviesSuccess;
const factory UpcomingMoviesState.failure(ApiErrorModel error) = UpcomingMoviesFailure;

const factory UpcomingMoviesState.genresSuccess(List<Genre> genresList)= UpcomingMoviesGenresSuccess;
const factory UpcomingMoviesState.genresFailure() = UpcomingMoviesGenresFailure;
}
