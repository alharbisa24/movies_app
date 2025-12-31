import 'package:dio/dio.dart';
import 'package:movies/home/toprated/data/models/top_rated_movies_response_model.dart';

import '../../../../core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'top_rated_movies_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class TopRatedMoviesApiService {
  factory TopRatedMoviesApiService(Dio dio, {String baseUrl}) =
      _TopRatedMoviesApiService;

  @GET(ApiConstants.popularMovies)
  Future<TopRatedMoviesResponseModel> getTopRatedMovies(
    @Query("page") int page,
  );
} 