
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/home/models/movie.dart';
part 'popular_movies_response_model.g.dart';

@JsonSerializable()
class PopularMoviesResponseModel {

  @JsonKey(name: "results")
  final List<Movie> movies;

  final int page;

  @JsonKey(name: "total_results")
  final int totalResults;

  @JsonKey(name: "total_pages")
  final int totalPages;

  PopularMoviesResponseModel({
    required this.movies,
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  factory PopularMoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesResponseModelToJson(this);
}