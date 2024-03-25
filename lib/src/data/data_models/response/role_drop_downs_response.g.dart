// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_drop_downs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleDropDownsResponse _$RoleDropDownsResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'RoleDropDownsResponse',
      json,
      ($checkedConvert) {
        final val = RoleDropDownsResponse(
          $checkedConvert('Label', (v) => v as String),
          $checkedConvert('Value', (v) => v as int),
          $checkedConvert('Name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'label': 'Label', 'value': 'Value', 'name': 'Name'},
    );

Map<String, dynamic> _$RoleDropDownsResponseToJson(
        RoleDropDownsResponse instance) =>
    <String, dynamic>{
      'Label': instance.label,
      'Value': instance.value,
      'Name': instance.name,
    };
