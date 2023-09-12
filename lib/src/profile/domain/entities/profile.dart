class Profile{
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final double? rating;
  final String? companyName;

  Profile({
     this.name,
     this.email,
     this.phone,
     this.image,
     this.rating,
     this.companyName,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      rating: json['rating'],
      companyName: json['companyName'],
    );
  }
}