import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/core/networking/api_error_model.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/genres/repo/genres_repo.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/home/toprated/data/repo/top_rated_movies_repo.dart';

part 'top_rated_movies_state.dart';
part 'top_rated_movies_cubit.freezed.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
final TopRatedMoviesRepo _TopRatedMoviesRepo;
  final GenresRepo _genresRepo;

  TopRatedMoviesCubit(this._TopRatedMoviesRepo, this._genresRepo) : super(TopRatedMoviesState.initial());

  List<Movie?>? topRatedMovies = [];
  List<Genre> genresList = [];

  void getTopRatedMovies() async {
    emit(const TopRatedMoviesState.loading());

    final genresResult = await _genresRepo.getGenres();
    genresResult.when(
      success: (data) {
        genresList = data.genres;
      },
      failure: (error) {
        emit(TopRatedMoviesState.genresFailure());
        return;
      },
    );

    final moviesResult = await _TopRatedMoviesRepo.getTopRatedMovies(1);
    moviesResult.when(
      success: (data) {
        topRatedMovies = data.movies;
        emit(TopRatedMoviesState.success(data.movies));
      },
      failure: (error) {
        emit(TopRatedMoviesState.failure(error));
      },
    );
  }  
}
