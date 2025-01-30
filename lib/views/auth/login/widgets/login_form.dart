import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/auth/auth_view_model.dart';

class NLoginForm extends StatelessWidget {
  const NLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    return Form(
      key: authVM.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: authVM.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              //re
              final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value)) {
                return 'Invalid Email Address';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: authVM.passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                authVM.login(context);
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
