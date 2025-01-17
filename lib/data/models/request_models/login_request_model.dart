import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  @JsonKey(name: 'user_name')
  final String? userName;

  @JsonKey(name: 'phone_no')
  final String? phoneNumber;
  final String password;

  const LoginRequestModel({
    this.userName,
    this.phoneNumber,
    required this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
