import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/home/genres/models/genres_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'genres_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class GenresApiService {
  factory GenresApiService(Dio dio, {String baseUrl}) =
      _GenresApiService;

  @GET(ApiConstants.genres)
  Future<GenresResponseModel> getGenres();
}