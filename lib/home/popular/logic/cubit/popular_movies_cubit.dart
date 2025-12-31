import 'package:bloc/bloc.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/home/popular/data/repo/popular_movies_repo.dart';
import 'package:movies/home/popular/logic/cubit/popular_movies_state.dart';
import 'package:movies/home/genres/repo/genres_repo.dart';
import 'package:movies/home/genres/models/genre.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final PopularMoviesRepo _popularMoviesRepo;
  final GenresRepo _genresRepo;

  PopularMoviesCubit(this._popularMoviesRepo, this._genresRepo) : super(PopularMoviesState.initial());

  List<Movie?>? popularMovies = [];
  List<Genre> genresList = [];

  void getPopularMovies() async {
    emit(const PopularMoviesState.loading());

    final genresResult = await _genresRepo.getGenres();
    genresResult.when(
      success: (data) {
        genresList = data.genres;
      },
      failure: (error) {
        emit(PopularMoviesState.genresFailure());
        return;
      },
    );

    final moviesResult = await _popularMoviesRepo.getPopularMovies(1);
    moviesResult.when(
      success: (data) {
        popularMovies = data.movies;
        emit(PopularMoviesState.success(data.movies));
      },
      failure: (error) {
        emit(PopularMoviesState.failure(error));
      },
    );
  }
}