// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_drop_downs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleDropDowns _$RoleDropDownsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RoleDropDowns',
      json,
      ($checkedConvert) {
        final val = RoleDropDowns(
          $checkedConvert('Label', (v) => v as String),
          $checkedConvert('Value', (v) => v as int),
          $checkedConvert('Name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'label': 'Label', 'value': 'Value', 'name': 'Name'},
    );

Map<String, dynamic> _$RoleDropDownsToJson(RoleDropDowns instance) =>
    <String, dynamic>{
      'Label': instance.label,
      'Value': instance.value,
      'Name': instance.name,
    };
