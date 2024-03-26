// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchResponse',
      json,
      ($checkedConvert) {
        final val = SearchResponse(
          $checkedConvert('totalRecords', (v) => v as int),
          $checkedConvert('duration', (v) => v as String),
          $checkedConvert(
              'result',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'totalRecords': instance.totalRecords,
      'duration': instance.duration,
      'result': instance.result?.map((e) => e.toJson()).toList(),
    };
