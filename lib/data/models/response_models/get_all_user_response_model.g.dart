// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserResponseModel _$GetAllUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllUserResponseModel(
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUserResponseModelToJson(
        GetAllUserResponseModel instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
