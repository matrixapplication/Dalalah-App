class RegisterParams {
  final String? ownerName;
  final String? name;
  final String? phone;
  final String? whatsapp;
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final int? cityId;

  final String? fcmToken;

  RegisterParams(
      { this.email,
       this.password,
      this.ownerName,
      this.name,
      this.phone,
      this.whatsapp,
      required this.passwordConfirmation,
      this.cityId,
      this.fcmToken});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'owner_name': ownerName ?? '',
      'name': name ?? '',
      'phone': phone ?? '',
      'email': email ?? '',
      'password': password ?? '',
      'password_confirmation': passwordConfirmation ?? '',
      'city_id': cityId ?? '',
      'whatsapp': whatsapp ?? '',
      'fcm_token': fcmToken ?? '',
    };

    // remove null values from map
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}
