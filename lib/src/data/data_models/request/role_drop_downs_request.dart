import 'package:json_annotation/json_annotation.dart';

part 'role_drop_downs_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class RoleDropDownsRequest {
  RoleDropDownsRequest();

  factory RoleDropDownsRequest.fromJson(Map<String, dynamic> json) =>
      _$RoleDropDownsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RoleDropDownsRequestToJson(this);
}
