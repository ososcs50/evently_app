import 'package:firebase_auth/firebase_auth.dart';

class Authservices {
  static Future<UserCredential> createacc(
    String email,
    String password,
    String name,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(name);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw ('This email is already registered.');
      } else if (e.code == 'weak-password') {
        throw ('Password is too weak.');
      } else {
        rethrow;
      }
    }
  }

  static Future<UserCredential> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided.');
      } else {
        rethrow;
      }
    }
  }
}
