import 'package:flutter/material.dart';
import 'package:notes_app/views/auth/forgot_password/widgets/reset_password_form.dart';
import 'package:notes_app/views/auth/login/login_view.dart';

import '../../../common/widgets/body/header.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              ///1. Header
              const SizedBox(
                height: 200,
              ),
              const NHeader(subTitle: "Reset Password"),
              const SizedBox(
                height: 36,
              ),

              /// 2. Email Field
              const NResetPasswordForm(),
              const SizedBox(
                height: 30,
              ),

              /// 6. Register Text and Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Continue with Login? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                      );
                    },
                    child: const Text("Login"),
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
