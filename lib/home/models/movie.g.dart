// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: (json['id'] as num).toInt(),
  title: json['original_title'] as String,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  releaseDate: json['release_date'] as String?,
  voteAverage: (json['vote_average'] as num).toDouble(),
  adult: json['adult'] as bool,
  originalLanguage: json['original_language'] as String,
  genreIds: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  genresList: (json['genres'] as List<dynamic>?)
      ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'id': instance.id,
  'original_title': instance.title,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'release_date': instance.releaseDate,
  'vote_average': instance.voteAverage,
  'adult': instance.adult,
  'original_language': instance.originalLanguage,
  'genre_ids': instance.genreIds,
  'genres': instance.genresList,
};
