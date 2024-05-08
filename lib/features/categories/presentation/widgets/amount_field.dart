import 'package:flutter/material.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;

  const AmountField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (name) {
        if (name == null || name.isEmpty) {
          return S.of(context).amount_required;
        }
        return null;
      },
      decoration: InputDecoration(labelText: S.of(context).amount),
      keyboardType: TextInputType.number,
    );
  }
}
