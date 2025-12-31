
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/home/genres/models/genre.dart';

part 'genres_response_model.g.dart';

@JsonSerializable()
class GenresResponseModel {

  @JsonKey(name: "genres")
    final List<Genre> genres;

  GenresResponseModel({
    required this.genres,
  });

    factory GenresResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenresResponseModelToJson(this);


}