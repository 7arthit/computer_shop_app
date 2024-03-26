import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/domain/entities/search/search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class SearchResponse extends Search {
  SearchResponse(
      super.totalRecords,
      super.duration,
      super.result
  );

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
