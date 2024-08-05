class LoginRealEstateDeveloperParams {
  String? phone;
  String? password;
  String? fcmToken;

  LoginRealEstateDeveloperParams({this.phone, this.password, this.fcmToken});

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'fcm_token': fcmToken,
    };
  }
}