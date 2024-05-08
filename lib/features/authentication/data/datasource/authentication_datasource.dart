import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  bool checkUserAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
