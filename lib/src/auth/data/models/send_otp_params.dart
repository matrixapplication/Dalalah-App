class SendOTPParams {
  String? modelRole;
  String? modelId;

  SendOTPParams({this.modelRole});

  Map<String, dynamic> toJson() {
    return {
      'model_role': modelRole,
      'model_id': modelId,
    };
  }
}