import 'package:movies/core/networking/api_error_handler.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/search/data/models/search_response_model.dart';

class SearchRepo {
  final _SearchApiService;

  SearchRepo(
    this._SearchApiService
  );

  Future<ApiResult<SearchResponseModel>> searchMovies(int page, String query) async {
    try {
      final response = await _SearchApiService.searchMovies(page, query);
      return ApiResult.success(response);
    } catch (e) {
        return ApiResult.failure(ApiErrorHandler.handle(e));
      
    }
  }
}

