class SendOTPParams {
  String? modelRole;
  String? modelId;

  SendOTPParams({this.modelRole, this.modelId});

  Map<String, dynamic> toJson() {
    return {
      'model_role': modelRole,
      'model_id': modelId,
    };
  }
}