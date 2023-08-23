class UserModel {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? token;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      token: json['token'] == null ? null : '${json['token']}',
    );
  }
}

class CurrentSubscribtion {
  int? id;
  int? providerId;
  int? subscriptionId;
  String? startsAt;
  String? endsAt;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? paymentMethod;
  int? userId;

  CurrentSubscribtion({
    this.id,
    this.providerId,
    this.subscriptionId,
    this.startsAt,
    this.endsAt,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.paymentMethod,
    this.userId,
  });

  factory CurrentSubscribtion.fromJson(Map<String, dynamic> json) {
    return CurrentSubscribtion(
      id: json['id'] as int?,
      providerId: json['provider_id'] as int?,
      subscriptionId: json['subscription_id'] as int?,
      startsAt: json['starts_at'] as String?,
      endsAt: json['ends_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: json['status'] as String?,
      paymentMethod: json['payment_method'] as String?,
      userId: json['user_id'] as int?,
    );
  }
}
