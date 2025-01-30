import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/repository/auth/auth_repository.dart';
import 'package:notes_app/views/home/home_view.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _auth = AuthRepository();
  //variables for login form
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //variables for register form
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController regEmail = TextEditingController();
  TextEditingController regPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  //variables for login form
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController resetPasswordEmail = TextEditingController();

  Future<void> login(BuildContext context) async {
    try {
      if (loginFormKey.currentState!.validate()) {
        final UserCredential user = await _auth.signInWithEmailAndPassword(
            emailController.text.trim(), passwordController.text.trim());
        if (user.user != null) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
          Fluttertoast.showToast(
            msg: "Login Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM, // Position at bottom
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          emailController.text = "";
          passwordController.text = "";
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, // Position at bottom
        backgroundColor: Colors.deepOrange,
        textColor: Colors.white,
      );
    }
  }

  Future<void> register(BuildContext context) async {
    try {
      if (registerFormKey.currentState!.validate()) {
        if (confirmPassword.text.trim() != regPassword.text.trim()) {
          Fluttertoast.showToast(
            msg: "Passwords do not match",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM, // Position at bottom
            backgroundColor: Colors.deepOrange,
            textColor: Colors.white,
          );
          return;
        }
        final UserCredential user = await _auth.signUpWithEmailAndPassword(
            regEmail.text.trim(), regPassword.text.trim());
        if (user.user != null) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
          Fluttertoast.showToast(
            msg: "Registration successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM, // Position at bottom
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        } else {}
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, // Position at bottom
        backgroundColor: Colors.deepOrange,
        textColor: Colors.white,
      );
    }
  }

  Future<void> resetPassword(BuildContext context) async {
    try {
      if (resetPasswordFormKey.currentState!.validate()) {
        await _auth.resetPassword(resetPasswordEmail.text.trim());
        Fluttertoast.showToast(
          msg: "Password Reset Link sent to email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM, // Position at bottom
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, // Position at bottom
        backgroundColor: Colors.deepOrange,
        textColor: Colors.white,
      );
    }
  }

  void checkLogin(BuildContext context) {
    _auth.checkLogin(context);
  }
}
