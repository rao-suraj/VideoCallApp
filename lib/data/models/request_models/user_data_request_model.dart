import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_request_model.g.dart';

@JsonSerializable()
class UserDataRequestModel {
  final String callerId;
  final String receiverId;

  const UserDataRequestModel(
      {required this.callerId, required this.receiverId});

  Map<String,dynamic> toJson() => _$UserDataRequestModelToJson(this);
}
