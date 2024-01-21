class ResetPasswordParams {
  String? email;
  String? userType;

  ResetPasswordParams({this.email, this.userType});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'user_type': userType,
    };
  }
}