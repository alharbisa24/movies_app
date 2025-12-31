
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/home/models/movie.dart';
part 'top_rated_movies_response_model.g.dart';

@JsonSerializable()
class TopRatedMoviesResponseModel {

  @JsonKey(name: "results")
  final List<Movie> movies;

  final int page;

  @JsonKey(name: "total_results")
  final int totalResults;

  @JsonKey(name: "total_pages")
  final int totalPages;

  TopRatedMoviesResponseModel({
    required this.movies,
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  factory TopRatedMoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMoviesResponseModelToJson(this);
}