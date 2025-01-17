class SignupRequestModel {
  final String userName;
  final String phoneNumber;
  final String password;

  SignupRequestModel({
    required this.userName,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'phone_no': phoneNumber,
        'password': password,
      };
}
