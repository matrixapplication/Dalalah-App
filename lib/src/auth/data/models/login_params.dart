class LoginParams {
  final String phoneNumber;
  final String password;

  LoginParams({required this.phoneNumber, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': phoneNumber,
      'password': password,
    };
  }
}