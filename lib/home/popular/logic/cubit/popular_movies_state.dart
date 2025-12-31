import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/core/networking/api_error_model.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/models/movie.dart';
part 'popular_movies_state.freezed.dart';


@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.initial() = _Initial;

const factory PopularMoviesState.loading() = PopularMoviesLoading;
const factory PopularMoviesState.success(List<Movie?> movies) = PopularMoviesSuccess;
const factory PopularMoviesState.failure(ApiErrorModel error) = PopularMoviesFailure;

const factory PopularMoviesState.genresSuccess(List<Genre> genresList)= PopularMoviesGenresSuccess;
const factory PopularMoviesState.genresFailure() = PopularMoviesGenresFailure;
}
 