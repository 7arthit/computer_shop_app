import 'package:json_annotation/json_annotation.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/domain/entities/product/product_type.dart';

part 'product_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class ProductResponse extends Product {
  ProductResponse(
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.name,
    super.description,
    super.unitPrice,
    super.stock,
    super.image,
    super.productId,
    super.productTypeId,
    super.productType,
    super.createdBy,
    super.updatedBy,
  );

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
