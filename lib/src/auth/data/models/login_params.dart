class LoginParams {
  String? email;
  String? password;
  String? fcmToken;

  LoginParams({this.email, this.password, this.fcmToken});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
    };
  }
}