import 'package:sweetcards/models/icon.dart';

class SweetCard {
  String id;
  DateTime date;
  String title;
  String user;
  SweetIcon icon;
  String? description;

  SweetCard({
    required this.id,
    required this.date,
    required this.title,
    required this.user,
    required this.icon,
    this.description,
  });

  factory SweetCard.fromCloud(Map<String, dynamic> json, String id) {
    return SweetCard(
      id: id,
      date: json['date'].toDate(),
      title: json['title'] as String,
      icon: SweetIcon.fromCloud(json['icon']),
      description: json['description'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toCloud() {
    return {
      'date': date,
      'title': title,
      'icon': icon.toCloud(),
      'description': description,
      'user': user,
    };
  }
}
