import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/views/auth/login/login_view.dart';

import '../../repository/auth/auth_repository.dart';
import '../../views/home/home_view.dart';

class SplashViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  Future<void> checkLogin(BuildContext context) async {
    bool isLogin = _authRepository.checkLogin(context);
    print("Game ON hai........ $isLogin");
    Timer(const Duration(seconds: 10), () {
      if (isLogin) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
      }
    });
  }
}
