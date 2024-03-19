import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "failure.g.dart";

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Failure extends Equatable {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'errors')
  final List<ErrorResponse>? errors;

  const Failure({this.message, this.code, this.errors, this.statusCode});

  @override
  List<Object> get props => [];

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);

  Map<String, dynamic> toJson() => _$FailureToJson(this);
}

class ServerFailure extends Failure {
  const ServerFailure(String message, {String? code})
      : super(message: message, code: code);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message, {String? code})
      : super(message: message, code: code);
}

class UnAuthorizeFailure extends Failure {
  const UnAuthorizeFailure({
    String? message,
    String? code,
    int? statusCode,
    List<ErrorResponse>? errors,
  }) : super(
    message: message,
    code: code,
    statusCode: statusCode,
    errors: errors,
  );
}

class DataModelFailure extends Failure {
  const DataModelFailure(String message, {String? code})
      : super(message: message, code: code);
}

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class UnAuthorizeResponse {
  const UnAuthorizeResponse(this.errors, this.message, this.code);
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final List<ErrorResponse>? errors;

  factory UnAuthorizeResponse.fromJson(Map<String, dynamic> json) =>
      _$UnAuthorizeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UnAuthorizeResponseToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class ErrorResponse {
  const ErrorResponse(this.message, this.code);

  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
