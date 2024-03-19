import 'package:json_annotation/json_annotation.dart';

part 'product_type.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class ProductType {
  ProductType(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
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

  factory ProductType.fromJson(Map<String, dynamic> json) => _$ProductTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);
}
