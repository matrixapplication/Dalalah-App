class RegisterParams {
  final String? name;
  final String? phone;
  final String email;
  final String password;

  RegisterParams({required this.email, required this.password, this.name, this.phone});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }
}