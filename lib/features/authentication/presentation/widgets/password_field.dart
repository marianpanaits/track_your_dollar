import 'package:flutter/material.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return S.of(context).password_not_empty;
        } else if (password.length < 6) {
          return S.of(context).password_minimum_six;
        } else if (!password.contains(RegExp(r'[A-Z]'))) {
          return S.of(context).password_uppercase_missing;
        } else if (!password.contains(RegExp(r'[a-z]'))) {
          return S.of(context).password_lowercase_missing;
        } else if (!password.contains(RegExp(r'[0-9]'))) {
          return S.of(context).password_digit_missing;
        } else if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
          return S.of(context).password_special_character_missing;
        }
        return null;
      },
      decoration: InputDecoration(labelText: S.of(context).password),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
