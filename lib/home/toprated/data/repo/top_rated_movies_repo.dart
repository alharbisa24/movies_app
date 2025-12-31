import 'package:movies/core/networking/api_error_handler.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/toprated/data/models/top_rated_movies_response_model.dart';

class TopRatedMoviesRepo {
  final _TopRatedMoviesApiService;

  TopRatedMoviesRepo(
    this._TopRatedMoviesApiService
  );

Future<ApiResult<TopRatedMoviesResponseModel>> getTopRatedMovies(int page) async {
    try {
      final response = await _TopRatedMoviesApiService.getTopRatedMovies(page);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

