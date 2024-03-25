// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Login',
      json,
      ($checkedConvert) {
        final val = Login(
          $checkedConvert('token', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'token': instance.token,
    };
