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
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: SweetTheme.primaryColor,
          colorScheme: ColorScheme.light(
            primary: SweetTheme.primaryColor,
            secondary: SweetTheme.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            headline3: TextStyle(
              fontSize: 54,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Sweet Cards',
        home: const SweetWrapper(),
      ),
    );
  }
}
