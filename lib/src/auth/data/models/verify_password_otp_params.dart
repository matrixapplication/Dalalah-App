class VerifyPasswordOTPParams {
  String? otp;
  String? loginUse;
  String? modelRole;

  VerifyPasswordOTPParams({this.otp, this.loginUse, this.modelRole});

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'login_use': loginUse,
      'model_role': modelRole,
    };
  }
}