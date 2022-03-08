import 'package:sweetcards/models/icon.dart';
import 'package:sweetcards/services/db.dart';

class SweetCard {
  String id;
  DateTime date;
  String title;
  String user;
  SweetIcon icon;
  String? description;
  DateTime? createdDate;
  bool isArchived;

  SweetCard({
    required this.id,
    required this.date,
    required this.title,
    required this.user,
    required this.icon,
    this.description,
    this.createdDate,
    this.isArchived = false,
  });

  factory SweetCard.fromCloud(Map<String, dynamic> json, String id) {
    return SweetCard(
      id: id,
      date: json['date'].toDate(),
      title: json['title'] as String,
      icon: SweetIcon.fromCloud(json['icon']),
      description: json['description'],
      user: json['user'],
      createdDate: json['createdDate']?.toDate(),
      isArchived: json['isArchived'] ?? false,
    );
  }

  Map<String, dynamic> toCloud() {
    return {
      'date': date,
      'title': title,
      'icon': icon.toCloud(),
      'description': description,
      'user': user,
      'createdDate': createdDate,
      'isArchived': isArchived,
    };
  }

  Future<void> delete() {
    return SweetUniverse().deleteCard(this);
  }

  Future<void> archive() {
    return SweetUniverse().archive(this);
  }

  Future<void> unarchive() {
    return SweetUniverse().archive(this, false);
  }
}
