class VerifyOTPParams {
  String? otp;
  String? modelId;
  String? modelRole;

  VerifyOTPParams({this.otp, this.modelId, this.modelRole});

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'model_id': modelId,
      'model_role': modelRole,
    };
  }
}