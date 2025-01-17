// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      userName: json['user_name'] as String?,
      phoneNumber: json['phone_no'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'phone_no': instance.phoneNumber,
      'password': instance.password,
    };
