import 'package:json_annotation/json_annotation.dart';

part 'reject_call_request_model.g.dart';

@JsonSerializable()
class RejectCallRequestModel {
  final String userId;
  final String id;

  const RejectCallRequestModel(
      {required this.userId, required this.id});

  Map<String,dynamic> toJson() => _$RejectCallRequestModelToJson(this);
}