import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetcards/firebase_options.dart';
import 'package:sweetcards/screens/wrapper.dart';
import 'package:sweetcards/services/auth.dart';
import 'package:sweetcards/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: SweetAuth.authStream,
      initialData: null,
      child: MaterialApp(
        theme: SweetTheme.theme,
        debugShowCheckedModeBanner: false,
        title: 'Sweet Cards',
        home: const SweetWrapper(),
      ),
    );
  }
}
