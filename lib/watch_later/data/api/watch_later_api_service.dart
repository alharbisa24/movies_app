import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/home/models/movie.dart';
import 'package:retrofit/retrofit.dart';

part 'watch_later_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class WatchLaterApiService {
  factory WatchLaterApiService(Dio dio, {String baseUrl}) = _WatchLaterApiService;

  @GET("movie/{movie_id}")
  Future<Movie> getMovieDetails(@Path("movie_id") String movieId);
}
