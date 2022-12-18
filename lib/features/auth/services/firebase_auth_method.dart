import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // Sign up User

  static Future<UserCredential> signUp({
    required email,
    required password,
  }) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  // Sing In User

  static Future<UserCredential> singIn(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  // Signout
  static Future<void> signOut() => FirebaseAuth.instance.signOut();
}
