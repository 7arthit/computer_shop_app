// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Search',
      json,
      ($checkedConvert) {
        final val = Search(
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

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'totalRecords': instance.totalRecords,
      'duration': instance.duration,
      'result': instance.result?.map((e) => e.toJson()).toList(),
    };
