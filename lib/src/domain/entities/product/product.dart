import 'package:json_annotation/json_annotation.dart';

import 'package:computer_shop_app/src/domain/entities/product/product_type.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Product {
  Product(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.description,
      this.unitPrice,
      this.stock,
      this.image,
      this.productId,
      this.productTypeId,
      this.productType,
      this.createdBy,
      this.updatedBy,
      );

  @JsonKey(name: 'ID')
  final int id;

  @JsonKey(name: 'CreatedAt')
  final String createdAt;

  @JsonKey(name: 'UpdatedAt')
  final String updatedAt;

  @JsonKey(name: 'DeletedAt')
  final dynamic deletedAt;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Description')
  final String description;

  @JsonKey(name: 'UnitPrice')
  final String unitPrice;

  @JsonKey(name: 'Stock')
  final int stock;

  @JsonKey(name: 'Image')
  final String image;

  @JsonKey(name: 'ProductId')
  final String productId;

  @JsonKey(name: 'ProductTypeID')
  final int productTypeId;

  @JsonKey(name: 'ProductType')
  final ProductType productType;

  @JsonKey(name: 'CreatedBy')
  final String createdBy;

  @JsonKey(name: 'UpdatedBy')
  final String updatedBy;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
