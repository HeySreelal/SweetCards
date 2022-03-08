class SweetCard {
  String id;
  String date;
  String title;
  String user;
  String? icon;
  String? description;

  SweetCard({
    required this.id,
    required this.date,
    required this.title,
    required this.user,
    this.icon,
    this.description,
  });

  factory SweetCard.fromCloud(Map<String, dynamic> json, String id) {
    return SweetCard(
      id: id,
      date: json['date'] as String,
      title: json['title'] as String,
      icon: json['icon'] ?? "default",
      description: json['description'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toCloud() {
    return {
      'date': date,
      'title': title,
      'icon': icon,
      'description': description,
      'user': user,
    };
  }
}
