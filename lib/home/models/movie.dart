import 'package:json_annotation/json_annotation.dart';
import 'package:movies/home/genres/models/genre.dart';
part 'movie.g.dart';


@JsonSerializable()
class Movie {
  final int id;

  @JsonKey(name: "original_title")
  final String title;

  final String? overview;

  @JsonKey(name: "poster_path")
  final String? posterPath;

  @JsonKey(name: "release_date")
  final String? releaseDate;

  @JsonKey(name: "vote_average")
  final double voteAverage;
  final bool adult;
  @JsonKey(name: "original_language")
  final String originalLanguage;

  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  

  @JsonKey(name: "genres")
  final List<Genre>? genresList;
  
  Movie({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    required this.voteAverage,
    required this.adult,
    required this.originalLanguage,
    this.genreIds,
    this.genresList,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  List<String> getGenreNames(List<Genre> genresList) {
    return genreIds?.map((id) {
      final genre = genresList.firstWhere((g) => g.id == id, orElse: () => Genre(id: id, name: 'Unknown'));
      return genre.name;
    }).toList() ?? [];
  }
}

