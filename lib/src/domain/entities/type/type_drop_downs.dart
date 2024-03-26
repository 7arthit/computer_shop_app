import 'package:json_annotation/json_annotation.dart';

part 'type_drop_downs.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class TypeDropDowns {
  TypeDropDowns(this.label, this.value, this.name);

  @JsonKey(name: 'Label')
  final String label;

  @JsonKey(name: 'Value')
  final int value;

  @JsonKey(name: 'Name')
  final String name;

  factory TypeDropDowns.fromJson(Map<String, dynamic> json) => _$TypeDropDownsFromJson(json);
  Map<String, dynamic> toJson() => _$TypeDropDownsToJson(this);
}
