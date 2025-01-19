
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
  final String token;
  final String otherUserId;
  const TokenResponseModel({required this.token, required this.otherUserId});

  factory TokenResponseModel.fromJson(Map<String,dynamic> json) => _$TokenResponseModelFromJson(json);
}
