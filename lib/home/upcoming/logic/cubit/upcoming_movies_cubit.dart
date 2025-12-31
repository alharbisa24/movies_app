import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/core/networking/api_error_model.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/genres/repo/genres_repo.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/home/upcoming/data/repo/upcoming_movies_repo.dart';

part 'upcoming_movies_state.dart';
part 'upcoming_movies_cubit.freezed.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
final UpcomingMoviesRepo _upcomingMoviesRepo;
  final GenresRepo _genresRepo;

  UpcomingMoviesCubit(this._upcomingMoviesRepo, this._genresRepo) : super(UpcomingMoviesState.initial());

  List<Movie?>? upcomingMovies = [];
  List<Genre> genresList = [];

  void getUpcomingMovies() async {
    emit(const UpcomingMoviesState.loading());

    final genresResult = await _genresRepo.getGenres();
    genresResult.when(
      success: (data) {
        genresList = data.genres;
      },
      failure: (error) {
        emit(UpcomingMoviesState.genresFailure());
        return;
      },
    );

    final moviesResult = await _upcomingMoviesRepo.getUpcomingMovies(1);
    moviesResult.when(
      success: (data) {
        upcomingMovies = data.movies;
        emit(UpcomingMoviesState.success(data.movies));
      },
      failure: (error) {
        emit(UpcomingMoviesState.failure(error));
      },
    );
  }  
}
