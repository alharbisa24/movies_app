import 'package:movies/core/networking/api_error_handler.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/popular/data/models/popular_movies_response_model.dart';

class PopularMoviesRepo {
  final _PopularMoviesApiService;

  PopularMoviesRepo(
    this._PopularMoviesApiService
  );

Future<ApiResult<PopularMoviesResponseModel>> getPopularMovies(int page) async {
    try {
      final response = await _PopularMoviesApiService.getPopularMovies(page);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

