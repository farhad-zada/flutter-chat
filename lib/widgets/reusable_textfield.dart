import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    super.key,
    required this.onChanged,
    this.hint,
    this.obscureText = false,
  });
  final String? hint;
  final Function(String value) onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black87,
      ),
      decoration: kTextFieldDecoration,
    );
  }
}
