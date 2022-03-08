import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/screens/home.dart';
import 'package:sweetcards/screens/login.dart';
import 'package:sweetcards/services/db.dart';

class SweetWrapper extends StatelessWidget {
  const SweetWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Provider.of<User?>(context) != null;

    if (isLoggedIn) {
      return StreamProvider<List<SweetCard>>.value(
        value: SweetUniverse().cards,
        initialData: const [],
        child: const SweetHome(),
      );
    } else {
      return const SweetLogin();
    }
  }
}
