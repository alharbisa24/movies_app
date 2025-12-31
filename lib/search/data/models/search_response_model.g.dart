// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      movies: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchResponseModelToJson(
  SearchResponseModel instance,
) => <String, dynamic>{
  'results': instance.movies,
  'page': instance.page,
  'total_results': instance.totalResults,
  'total_pages': instance.totalPages,
};
