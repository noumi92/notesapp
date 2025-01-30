import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/auth/auth_view_model.dart';

class NResetPasswordForm extends StatelessWidget {
  const NResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    return Form(
      key: authVM.resetPasswordFormKey,
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                authVM.resetPassword(context);
              },
              child: Text('Reset Password'),
            ),
          ),
        ],
      ),
    );
  }
}
