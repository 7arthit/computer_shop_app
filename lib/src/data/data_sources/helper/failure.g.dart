// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Failure',
      json,
      ($checkedConvert) {
        final val = Failure(
          message: $checkedConvert('message', (v) => v as String?),
          code: $checkedConvert('code', (v) => v as String?),
          errors: $checkedConvert(
              'errors',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => ErrorResponse.fromJson(e as Map<String, dynamic>))
                  .toList()),
          statusCode: $checkedConvert('status_code', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'statusCode': 'status_code'},
    );

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'status_code': instance.statusCode,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };

UnAuthorizeResponse _$UnAuthorizeResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UnAuthorizeResponse',
      json,
      ($checkedConvert) {
        final val = UnAuthorizeResponse(
          $checkedConvert(
              'errors',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => ErrorResponse.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('message', (v) => v as String?),
          $checkedConvert('code', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$UnAuthorizeResponseToJson(
        UnAuthorizeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ErrorResponse',
      json,
      ($checkedConvert) {
        final val = ErrorResponse(
          $checkedConvert('message', (v) => v as String?),
          $checkedConvert('code', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
