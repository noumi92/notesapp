import 'package:flutter/material.dart';
import 'package:notes_app/view_model/auth/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    SplashViewModel splashVM = Provider.of<SplashViewModel>(context);
    splashVM.checkLogin(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "NoteApp",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ],
      ),
    );
  }
}
