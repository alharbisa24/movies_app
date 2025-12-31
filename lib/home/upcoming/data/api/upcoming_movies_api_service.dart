import 'package:dio/dio.dart';
import 'package:movies/home/upcoming/data/models/upcoming_movies_response_model.dart';

import '../../../../core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'upcoming_movies_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class UpcomingMoviesApiService {
  factory UpcomingMoviesApiService(Dio dio, {String baseUrl}) =
      _UpcomingMoviesApiService;

  @GET(ApiConstants.popularMovies)
  Future<UpcomingMoviesResponseModel> getUpcomingMovies(
    @Query("page") int page,
  );
} 