import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Login {
  Login(this.token);

  @JsonKey(name: 'token')
  final String token;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
