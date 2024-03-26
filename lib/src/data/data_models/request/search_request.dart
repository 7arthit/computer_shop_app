import 'package:json_annotation/json_annotation.dart';

part 'search_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class SearchRequest {
  SearchRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.sortField,
    required this.sortOrder,
    required this.criteria,
  });

  @JsonKey(name: 'pageIndex')
  final int pageIndex;

  @JsonKey(name: 'pageSize')
  final int pageSize;

  @JsonKey(name: 'sortField')
  final String sortField;

  @JsonKey(name: 'sortOrder')
  final int sortOrder;

  @JsonKey(name: 'criteria')
  final Criteria criteria;

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Criteria {
  Criteria({
    required this.productName,
    required this.productTypeId,
  });

  @JsonKey(name: 'productName')
  final String productName;

  @JsonKey(name: 'productTypeId')
  final int productTypeId;

  factory Criteria.fromJson(Map<String, dynamic> json) =>
      _$CriteriaFromJson(json);
  Map<String, dynamic> toJson() => _$CriteriaToJson(this);
}
