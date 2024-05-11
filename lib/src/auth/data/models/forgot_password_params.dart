class ForgotPasswordParams {
  final String loginUse;
  final String modelRole;
  final String password;

  ForgotPasswordParams({required this.loginUse, required this.modelRole, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'login_use': loginUse,
      'model_role': modelRole,
      'password': password,
    };
  }
}