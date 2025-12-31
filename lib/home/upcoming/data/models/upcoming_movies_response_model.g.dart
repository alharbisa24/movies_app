// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMoviesResponseModel _$UpcomingMoviesResponseModelFromJson(
  Map<String, dynamic> json,
) => UpcomingMoviesResponseModel(
  movies: (json['results'] as List<dynamic>)
      .map((e) => Movie.fromJson(e as Map<String, dynamic>))
      .toList(),
  page: (json['page'] as num).toInt(),
  totalResults: (json['total_results'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);

Map<String, dynamic> _$UpcomingMoviesResponseModelToJson(
  UpcomingMoviesResponseModel instance,
) => <String, dynamic>{
  'results': instance.movies,
  'page': instance.page,
  'total_results': instance.totalResults,
  'total_pages': instance.totalPages,
};
