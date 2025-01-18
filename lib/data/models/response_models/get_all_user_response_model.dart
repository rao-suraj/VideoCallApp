import 'package:freezed_annotation/freezed_annotation.dart';
import '../user.dart';

part 'get_all_user_response_model.g.dart';

@JsonSerializable()
class GetAllUserResponseModel {
  final List<User> users;

  GetAllUserResponseModel({required this.users});

  factory GetAllUserResponseModel.fromJson(Map<String, dynamic> json) => _$GetAllUserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllUserResponseModelToJson(this);
}
