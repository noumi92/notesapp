import 'package:flutter/material.dart';
import 'package:notes_app/common/widgets/body/header.dart';
import 'package:notes_app/views/auth/login/login_view.dart';
import 'package:notes_app/views/auth/register/widgets/register_form.dart';
import 'package:provider/provider.dart';

import '../../../view_model/auth/auth_view_model.dart';
import '../forgot_password/forgot_password_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authVM = Provider.of<AuthViewModel>(context);
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
              const NHeader(subTitle: "Register new Account"),
              const SizedBox(
                height: 36,
              ),

              /// 2. Email Field
              const NRegisterForm(),
              const SizedBox(
                height: 50,
              ),

              /// 5. Sign in button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                      );
                    },
                    child: const Text("Sign In")),
              ),
              const SizedBox(
                height: 30,
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
