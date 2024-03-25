import 'package:computer_shop_app/src/domain/entities/role_drop_downs/role_drop_downs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_drop_downs_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class RoleDropDownsResponse extends RoleDropDowns {
  RoleDropDownsResponse(
      super.label,
      super.value,
      super.name
      );

  factory RoleDropDownsResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleDropDownsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RoleDropDownsResponseToJson(this);
}
