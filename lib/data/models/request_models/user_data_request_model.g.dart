// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataRequestModel _$UserDataRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserDataRequestModel(
      callerId: json['callerId'] as String,
      receiverId: json['receiverId'] as String,
    );

Map<String, dynamic> _$UserDataRequestModelToJson(
        UserDataRequestModel instance) =>
    <String, dynamic>{
      'callerId': instance.callerId,
      'receiverId': instance.receiverId,
    };
