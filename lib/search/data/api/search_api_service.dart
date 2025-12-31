import 'package:dio/dio.dart';
import 'package:movies/search/data/models/search_response_model.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String baseUrl}) = _SearchApiService;

  @GET(ApiConstants.search)
  Future<SearchResponseModel> searchMovies(
    @Query("page") int page,
    @Query("query") String query,
  );
}