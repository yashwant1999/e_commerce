import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // Sign up User

  static Future<String?> signUp({required email, required password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Sing In User

  static Future<String?> singIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Signout
  static Future<void> signOut() => FirebaseAuth.instance.signOut();
}
