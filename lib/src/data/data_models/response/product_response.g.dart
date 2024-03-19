// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProductResponse',
      json,
      ($checkedConvert) {
        final val = ProductResponse(
          $checkedConvert('ID', (v) => v as int),
          $checkedConvert('CreatedAt', (v) => v as String),
          $checkedConvert('UpdatedAt', (v) => v as String),
          $checkedConvert('DeletedAt', (v) => v),
          $checkedConvert('Name', (v) => v as String),
          $checkedConvert('Description', (v) => v as String),
          $checkedConvert('UnitPrice', (v) => v as String),
          $checkedConvert('Stock', (v) => v as int),
          $checkedConvert('Image', (v) => v as String),
          $checkedConvert('ProductId', (v) => v as String),
          $checkedConvert('ProductTypeID', (v) => v as int),
          $checkedConvert('ProductType',
              (v) => ProductType.fromJson(v as Map<String, dynamic>)),
          $checkedConvert('CreatedBy', (v) => v as String),
          $checkedConvert('UpdatedBy', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'ID',
        'createdAt': 'CreatedAt',
        'updatedAt': 'UpdatedAt',
        'deletedAt': 'DeletedAt',
        'name': 'Name',
        'description': 'Description',
        'unitPrice': 'UnitPrice',
        'stock': 'Stock',
        'image': 'Image',
        'productId': 'ProductId',
        'productTypeId': 'ProductTypeID',
        'productType': 'ProductType',
        'createdBy': 'CreatedBy',
        'updatedBy': 'UpdatedBy'
      },
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'Name': instance.name,
      'Description': instance.description,
      'UnitPrice': instance.unitPrice,
      'Stock': instance.stock,
      'Image': instance.image,
      'ProductId': instance.productId,
      'ProductTypeID': instance.productTypeId,
      'ProductType': instance.productType.toJson(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
    };
