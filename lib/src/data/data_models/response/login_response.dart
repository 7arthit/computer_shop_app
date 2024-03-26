import 'package:computer_shop_app/src/domain/entities/login/login.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class LoginResponse extends Login {
  LoginResponse(
      super.token,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
