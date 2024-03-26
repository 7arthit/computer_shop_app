// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTypeResponse _$ProductTypeResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProductTypeResponse',
      json,
      ($checkedConvert) {
        final val = ProductTypeResponse(
          $checkedConvert('Label', (v) => v as String),
          $checkedConvert('Value', (v) => v as int),
          $checkedConvert('Name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'label': 'Label', 'value': 'Value', 'name': 'Name'},
    );

Map<String, dynamic> _$ProductTypeResponseToJson(
        ProductTypeResponse instance) =>
    <String, dynamic>{
      'Label': instance.label,
      'Value': instance.value,
      'Name': instance.name,
    };
