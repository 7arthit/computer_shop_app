import 'package:json_annotation/json_annotation.dart';

part 'role_drop_downs.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class RoleDropDowns {
  RoleDropDowns(this.label, this.value, this.name);

  @JsonKey(name: 'Label')
  final String label;

  @JsonKey(name: 'Value')
  final int value;

  @JsonKey(name: 'Name')
  final String name;

  factory RoleDropDowns.fromJson(Map<String, dynamic> json) => _$RoleDropDownsFromJson(json);
  Map<String, dynamic> toJson() => _$RoleDropDownsToJson(this);
}
