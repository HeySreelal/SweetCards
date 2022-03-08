import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/models/user.dart';
import 'package:sweetcards/services/auth.dart';

class SweetUniverse {
  final _db = FirebaseFirestore.instance;
  final _user = SweetAuth.currentUser;

  Future<void> newUser(User user) {
    final person = SweetPerson.fromUser(user);
    return _db.doc("people/${user.uid}").set(
          person.toJson(),
        );
  }

  Stream<List<SweetCard>> get cards {
    return _db
        .collection("cards")
        .where("user", isEqualTo: _user!.uid)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => SweetCard.fromCloud(
                  doc.data(),
                  doc.id,
                ),
              )
              .toList(),
        );
  }
}
