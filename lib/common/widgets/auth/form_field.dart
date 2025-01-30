import 'package:flutter/material.dart';

class NFormField extends StatelessWidget {
  const NFormField({
    super.key,
    required this.icon,
    this.obscure = false,
    this.label = '',
  });

  final bool obscure;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.none,
      obscureText: obscure,
      autofocus: false,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          fillColor: const Color(0xffE7e7f2),
          filled: true,
          prefixIcon: Icon(icon, size: 16),
          prefixIconColor: const Color(0xff00205c),
          label: Text(
            label,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
