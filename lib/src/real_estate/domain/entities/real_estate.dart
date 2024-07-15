
class Notifications{
  final int id;
  final String image;
  final String date;
  final String title;
  final String time;
  final String description;


  Notifications({required this.id, required this.date, required this.title, required this.time, required this.description, required this.image});

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      title: json['title']  ?? '',
      time: json['time'] ?? '',
      description: json['message'] ?? '',
      image: json['image'] ?? '',

    );
  }
}