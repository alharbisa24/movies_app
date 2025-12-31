
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/home/models/movie.dart';
part 'upcoming_movies_response_model.g.dart';

@JsonSerializable()
class UpcomingMoviesResponseModel {

  @JsonKey(name: "results")
  final List<Movie> movies;

  final int page;

  @JsonKey(name: "total_results")
  final int totalResults;

  @JsonKey(name: "total_pages")
  final int totalPages;

  UpcomingMoviesResponseModel({
    required this.movies,
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  factory UpcomingMoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMoviesResponseModelToJson(this);
}