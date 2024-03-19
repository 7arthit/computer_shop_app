// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      json['code'] as int,
      json['isSuccess'] as bool,
      json['errors'] as List<dynamic>,
      json['message'],
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'isSuccess': instance.isSuccess,
      'errors': instance.errors,
      'message': instance.message,
      'data': toJsonT(instance.data),
    };
