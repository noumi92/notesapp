import 'package:flutter/material.dart';
import 'package:notes_app/common/widgets/body/header.dart';
import 'package:notes_app/views/auth/forgot_password/forgot_password_view.dart';
import 'package:notes_app/views/auth/login/widgets/login_form.dart';
import 'package:notes_app/views/auth/register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),

              /// 1. Header
              const NHeader(subTitle: "Login to App"),
              const SizedBox(
                height: 36,
              ),

              /// 2. Email Field
              const NLoginForm(),
              SizedBox(
                height: 30,
              ),

              /// 5. Forgot Password Text
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterView()),
                      );
                    },
                    child: const Text("Register")),
              ),
              const SizedBox(
                height: 8,
              ),

              /// 6. Register Text and Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Forgot your Password? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordView()),
                      );
                    },
                    child: const Text("Reset Password"),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
