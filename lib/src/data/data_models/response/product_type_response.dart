import 'package:computer_shop_app/src/domain/entities/type/type_drop_downs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_type_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class ProductTypeResponse extends TypeDropDowns {
  ProductTypeResponse(
      super.label,
      super.value,
      super.name
      );

  factory ProductTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductTypeResponseToJson(this);
}
