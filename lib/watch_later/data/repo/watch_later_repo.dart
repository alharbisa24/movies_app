import 'package:movies/core/networking/api_error_handler.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/database/app_database.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/watch_later/data/api/watch_later_api_service.dart';

class WatchLaterRepo {
  final WatchLaterApiService _apiService;
  final AppDatabase _database;

  WatchLaterRepo(this._apiService, this._database);

  Future<ApiResult<List<Movie>>> getWatchLaterMovies() async {
    try {
      final watchLaterList = await _database.getAllWatchLaters();
      
      
      if (watchLaterList.isEmpty) {
        return ApiResult.success([]);
      }

      List<Movie> movies = [];
      
      for (var item in watchLaterList) {
        try {
          final movie = await _apiService.getMovieDetails(item.movieId);
          movies.add(movie);
        } catch (e) {
          print('Error fetching movie ${item.movieId}: $e');
        }
      }

      return ApiResult.success(movies);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<Movie>> getMovieById(String movieId) async {
    try {
      final movie = await _apiService.getMovieDetails(movieId);
      return ApiResult.success(movie);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Stream<List<WatchLaterData>> watchWatchLater() {
    return _database.watchWatchLaters();
  }

  Future<bool> addToWatchLater(String movieId) async {
    try {
      await _database.addWatchLater(
        WatchLaterCompanion.insert(
          movieId: movieId,
          addedAt: DateTime.now(),
        ),
      );
      return true;
    } catch (e) {

      return false;
    }
  }

  Future<bool> removeFromWatchLater(int movieId) async {
    try {
      await _database.deleteWatchLater(movieId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isInWatchLater(String movieId) async {
    final watchLaterList = await _database.getAllWatchLaters();
    return watchLaterList.any((item) => item.movieId == movieId);
  }
}
