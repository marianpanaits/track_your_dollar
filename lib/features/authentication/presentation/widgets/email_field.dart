import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (email) {
        if (email == null || email.isEmpty) {
          return S.of(context).email_cannot_be_empty;
        } else if (!EmailValidator.validate(email)) {
          return S.of(context).wrong_email_format;
        }
        return null;
      },
      decoration: InputDecoration(labelText: S.of(context).email),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
