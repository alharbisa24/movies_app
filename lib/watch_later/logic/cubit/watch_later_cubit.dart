import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/core/networking/api_error_model.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/watch_later/data/repo/watch_later_repo.dart';

part 'watch_later_state.dart';
part 'watch_later_cubit.freezed.dart';

class WatchLaterCubit extends Cubit<WatchLaterState> {
  final WatchLaterRepo _watchLaterRepo;

  WatchLaterCubit(this._watchLaterRepo) 
      : super(const WatchLaterState.initial());

  List<Movie> watchLaterMovies = [];

  void getWatchLaterMovies() async {
    emit(const WatchLaterState.loading());

    final result = await _watchLaterRepo.getWatchLaterMovies();
    
    result.when(
      success: (movies) {
        watchLaterMovies = movies;
        if (movies.isEmpty) {
          emit(const WatchLaterState.empty());
        } else {
          emit(WatchLaterState.success(movies));
        }
      },
      failure: (error) {
        emit(WatchLaterState.failure(error));
      },
    );
  }

  Future<bool> addToWatchLater(String movieId) async {
    final result = await _watchLaterRepo.addToWatchLater(movieId);
    if (result) {
      getWatchLaterMovies();
    }
    return result;
  }

  Future<bool> removeFromWatchLater(int movieId) async {
    final result = await _watchLaterRepo.removeFromWatchLater(movieId);
    if (result) {
      getWatchLaterMovies();
    }
    return result;
  }

  Future<bool> isInWatchLater(String movieId) async {
    return await _watchLaterRepo.isInWatchLater(movieId);
  }
}
