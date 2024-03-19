import 'package:json_annotation/json_annotation.dart';

part 'product_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class ProductRequest {
  ProductRequest();

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);
}
