class ForgotPasswordParams {
  final String newPassword;
  final String confirmPassword;

  ForgotPasswordParams({required this.newPassword, required this.confirmPassword});

  Map<String, dynamic> toJson() {
    return {
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }
}