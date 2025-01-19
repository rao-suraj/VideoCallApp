import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_call_request_model.g.dart';

@JsonSerializable()
class AcceptCallRequestModel {
  final String callerId;
  final String receiverId;

  const AcceptCallRequestModel(
      {required this.callerId, required this.receiverId});

  Map<String,dynamic> toJson() => _$AcceptCallRequestModelToJson(this);
}
