// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_call_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptCallRequestModel _$AcceptCallRequestModelFromJson(
        Map<String, dynamic> json) =>
    AcceptCallRequestModel(
      callerId: json['callerId'] as String,
      receiverId: json['receiverId'] as String,
    );

Map<String, dynamic> _$AcceptCallRequestModelToJson(
        AcceptCallRequestModel instance) =>
    <String, dynamic>{
      'callerId': instance.callerId,
      'receiverId': instance.receiverId,
    };
