// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedMoviesResponseModel _$TopRatedMoviesResponseModelFromJson(
  Map<String, dynamic> json,
) => TopRatedMoviesResponseModel(
  movies: (json['results'] as List<dynamic>)
      .map((e) => Movie.fromJson(e as Map<String, dynamic>))
      .toList(),
  page: (json['page'] as num).toInt(),
  totalResults: (json['total_results'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);

Map<String, dynamic> _$TopRatedMoviesResponseModelToJson(
  TopRatedMoviesResponseModel instance,
) => <String, dynamic>{
  'results': instance.movies,
  'page': instance.page,
  'total_results': instance.totalResults,
  'total_pages': instance.totalPages,
};
