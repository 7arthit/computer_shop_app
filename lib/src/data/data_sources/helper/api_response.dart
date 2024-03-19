import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.snake,
)
class ApiResponse<T> {
  const ApiResponse(this.code, this.isSuccess, this.errors, this.message, this.data);

  @JsonKey(name: "code")
  final int code;

  @JsonKey(name: "isSuccess")
  final bool isSuccess;

  @JsonKey(name: "errors")
  final List<dynamic> errors;

  @JsonKey(name: "message")
  final dynamic message;

  @JsonKey(name: "data")
  final T data;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
