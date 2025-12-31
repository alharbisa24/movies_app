import 'package:movies/core/networking/api_error_handler.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/home/genres/models/genres_response_model.dart';

class GenresRepo {
  final _GenresApiService;

  GenresRepo(
    this._GenresApiService
  );

Future<ApiResult<GenresResponseModel>> getGenres() async {
    try {
      final response = await _GenresApiService.getGenres();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

