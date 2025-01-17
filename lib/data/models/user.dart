import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../utils/app_constants.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: HiveConstants.userHiveId)
class User with _$User {
  factory User({
    
    @HiveField(0)
    required int id,

    @HiveField(1)
    @JsonKey(name: 'user_name')
    required String name,

    @HiveField(2)
    @JsonKey(name: 'phone_no')
    required int phoneNumber,
  }) = _User;


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}