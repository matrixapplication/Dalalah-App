class PasswordOTPParams {
  String? loginUse;
  String? modelRole;

  PasswordOTPParams({this.loginUse, this.modelRole});

  Map<String, dynamic> toJson() {
    return {
      'login_use': loginUse,
      'model_role': modelRole,
    };
  }
}