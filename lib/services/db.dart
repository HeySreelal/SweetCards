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

  Stream<List<SweetCard>> cards({bool isArchived = false}) {
    return _db
        .collection("cards")
        .where("user", isEqualTo: _user!.uid)
        .where("isArchived", isEqualTo: isArchived)
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
      card.createdDate = DateTime.now();

      await _db.collection("cards").add(card.toCloud());
      showMsg("Card Created 🎉");
    } catch (err) {
      showMsg("An error occured. 😕");
    }
  }

  // Delete a card
  Future<void> deleteCard(SweetCard card) async {
    try {
      await _db.doc("cards/${card.id}").delete();
      showMsg("Card Deleted 🎉");
    } catch (err) {
      showMsg("An error occured. 😕");
    }
  }

  // Archive a card
  Future<void> archive(SweetCard card, [bool shouldArchive = true]) async {
    try {
      card.isArchived = shouldArchive;
      await _db.doc("cards/${card.id}").update(card.toCloud());
      showMsg("Card Archived 🎉");
    } catch (err) {
      showMsg("An error occured. 😕");
    }
  }

  // Archived cards stream
}
