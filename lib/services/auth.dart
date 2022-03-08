import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sweetcards/services/db.dart';
import 'package:sweetcards/utils/toast.dart';

class SweetAuth {
  static final _auth = FirebaseAuth.instance;

  static User? get currentUser => _auth.currentUser;
  static Stream<User?> get authStream => _auth.authStateChanges();

  static void logOut() {
    _auth.signOut();
    GoogleSignIn().signOut();
  }

  static Future<bool> signIn() async {
    try {
      final account = await GoogleSignIn().signIn();
      final auth = await account?.authentication;

      final creds = GoogleAuthProvider.credential(
        accessToken: auth?.accessToken,
        idToken: auth?.idToken,
      );
      final ucreds = await _auth.signInWithCredential(creds);

      if (ucreds.user == null) return false;

      if (ucreds.additionalUserInfo!.isNewUser) {
        await SweetUniverse().newUser(ucreds.user!);
      }
      showMsg("Welcome to Sweet Cards!");
      return true;
    } catch (err) {
      showMsg("An error occured");
      return false;
    }
  }
}
