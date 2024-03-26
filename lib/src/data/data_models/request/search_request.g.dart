// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchRequest',
      json,
      ($checkedConvert) {
        final val = SearchRequest(
          pageIndex: $checkedConvert('pageIndex', (v) => v as int),
          pageSize: $checkedConvert('pageSize', (v) => v as int),
          sortField: $checkedConvert('sortField', (v) => v as String),
          sortOrder: $checkedConvert('sortOrder', (v) => v as int),
          criteria: $checkedConvert(
              'criteria', (v) => Criteria.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'sortField': instance.sortField,
      'sortOrder': instance.sortOrder,
      'criteria': instance.criteria.toJson(),
    };

Criteria _$CriteriaFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Criteria',
      json,
      ($checkedConvert) {
        final val = Criteria(
          productName: $checkedConvert('productName', (v) => v as String),
          productTypeId: $checkedConvert('productTypeId', (v) => v as int),
        );
        return val;
      },
    );

Map<String, dynamic> _$CriteriaToJson(Criteria instance) => <String, dynamic>{
      'productName': instance.productName,
      'productTypeId': instance.productTypeId,
    };
