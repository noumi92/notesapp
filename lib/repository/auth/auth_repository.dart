import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../views/auth/login/login_view.dart';
import '../../views/home/home_view.dart';

class AuthRepository {
  ///Variables
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> resetPassword(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginView()));
  }

  checkLogin(BuildContext context) async {
    final user = _auth.currentUser;
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    }
  }
}
