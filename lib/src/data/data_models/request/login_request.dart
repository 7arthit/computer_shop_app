import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
    required this.roleId,
  });

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'roleId')
  final int roleId;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
