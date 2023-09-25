class ShowroomLoginParams {
  String? code;
  String? password;
  String? fcmToken;

  ShowroomLoginParams({this.code, this.password, this.fcmToken});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'password': password,
      'fcm_token': fcmToken,
    };
  }
}