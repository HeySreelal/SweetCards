import 'package:firebase_auth/firebase_auth.dart';

const defaultPic =
    "https://firebasestorage.googleapis.com/v0/b/sweet-card.appspot.com/o/base%2Favatar.png?alt=media&token=f7a36eb6-cc1b-43a2-9ef8-1ce383ce7125";

class SweetPerson {
  String name;
  String photo;
  String email;
  String uid;
  DateTime created;

  SweetPerson({
    required this.name,
    required this.photo,
    required this.email,
    required this.uid,
    required this.created,
  });

  factory SweetPerson.fromCloud(Map<String, dynamic> data, String uid) {
    final String name = data['name'];
    final String photo = data['photo'];
    final String email = data['email'];
    final DateTime created = data['created'].toDate();

    return SweetPerson(
      name: name,
      photo: photo,
      email: email,
      uid: uid,
      created: created,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'email': email,
      'uid': uid,
      'created': created,
    };
  }

  factory SweetPerson.fromUser(User user) {
    return SweetPerson(
      name: user.displayName ?? "User",
      photo: user.photoURL ?? defaultPic,
      email: user.email!,
      uid: user.uid,
      created: DateTime.now(),
    );
  }
}
