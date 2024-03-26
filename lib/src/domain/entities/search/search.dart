import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Search {
  Search(this.totalRecords, this.duration, this.result);

  @JsonKey(name: 'totalRecords')
  final int totalRecords;

  @JsonKey(name: 'duration')
  final String duration;

  @JsonKey(name: 'result')
  final List<Product>? result;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
