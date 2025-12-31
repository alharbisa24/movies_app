import 'package:json_annotation/json_annotation.dart';
import 'package:movies/home/models/movie.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  @JsonKey(name: "results")
  final List<Movie> movies;

  final int page;

  @JsonKey(name: "total_results")
  final int? totalResults;

  @JsonKey(name: "total_pages")
  final int? totalPages;

  SearchResponseModel({
    required this.movies,
    required this.page,
    this.totalResults,
    this.totalPages,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}