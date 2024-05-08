import 'package:flutter/material.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class PasswordConfirmationField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;

  const PasswordConfirmationField(
      {super.key, required this.controller, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (passwordConfirmation) {
        if (passwordConfirmation == null ||
            passwordConfirmation.isEmpty ||
            passwordConfirmation != passwordController.text) {
          return S.of(context).password_mismatch;
        }
        return null;
      },
      decoration:
          InputDecoration(labelText: S.of(context).password_confirmation),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
