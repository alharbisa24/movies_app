import 'package:movies/core/networking/api_error_handler.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/upcoming/data/models/upcoming_movies_response_model.dart';

class UpcomingMoviesRepo {
  final _UpcomingMoviesApiService;

  UpcomingMoviesRepo(
    this._UpcomingMoviesApiService
  );

Future<ApiResult<UpcomingMoviesResponseModel>> getUpcomingMovies(int page) async {
    try {
      final response = await _UpcomingMoviesApiService.getUpcomingMovies(page);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

