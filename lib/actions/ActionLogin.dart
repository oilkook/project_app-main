import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ActionLogin {
  loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ]);
      GoogleSignInAccount user = await googleSignIn.signIn();
      // final res = await googleSignIn.signIn();
      print(user.displayName);
    } catch (err) {
      print(err);
    }
  }

  registerWithEmail({String mail, String pass}) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ]);
      final auth = FirebaseAuth.instance;
      var result = await auth.createUserWithEmailAndPassword(
          email: mail, password: pass);

      print('result $result');

      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  logout() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);

    googleSignIn.signOut();
  }
}
