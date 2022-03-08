import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/models/user.dart';
import 'package:sweetcards/services/auth.dart';
import 'package:sweetcards/utils/toast.dart';

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

  Future<void> newCard(SweetCard card) async {
    try {
      card.user = _user!.uid;
      await _db.collection("cards").add(card.toCloud());
      showMsg("Card Created 🎉");
    } catch (err) {
      showMsg("An error occured. 😕");
    }
  }
}
