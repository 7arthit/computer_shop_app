import 'package:json_annotation/json_annotation.dart';

part 'product_type_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class ProductTypeRequest {
  ProductTypeRequest();

  factory ProductTypeRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ProductTypeRequestToJson(this);
}
