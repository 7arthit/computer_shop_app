// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_drop_downs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeDropDowns _$TypeDropDownsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TypeDropDowns',
      json,
      ($checkedConvert) {
        final val = TypeDropDowns(
          $checkedConvert('Label', (v) => v as String),
          $checkedConvert('Value', (v) => v as int),
          $checkedConvert('Name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'label': 'Label', 'value': 'Value', 'name': 'Name'},
    );

Map<String, dynamic> _$TypeDropDownsToJson(TypeDropDowns instance) =>
    <String, dynamic>{
      'Label': instance.label,
      'Value': instance.value,
      'Name': instance.name,
    };
