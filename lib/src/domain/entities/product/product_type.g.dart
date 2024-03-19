// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ProductType',
      json,
      ($checkedConvert) {
        final val = ProductType(
          $checkedConvert('ID', (v) => v as int),
          $checkedConvert('CreatedAt', (v) => v as String),
          $checkedConvert('UpdatedAt', (v) => v as String),
          $checkedConvert('DeletedAt', (v) => v),
          $checkedConvert('Name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'ID',
        'createdAt': 'CreatedAt',
        'updatedAt': 'UpdatedAt',
        'deletedAt': 'DeletedAt',
        'name': 'Name'
      },
    );

Map<String, dynamic> _$ProductTypeToJson(ProductType instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'Name': instance.name,
    };
