import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/home/popular/data/models/popular_movies_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'popular_movies_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PopularMoviesApiService {
  factory PopularMoviesApiService(Dio dio, {String baseUrl}) =
      _PopularMoviesApiService;

  @GET(ApiConstants.popularMovies)
  Future<PopularMoviesResponseModel> getPopularMovies(
    @Query("page") int page,
  );
} 