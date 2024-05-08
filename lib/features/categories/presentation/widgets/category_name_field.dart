import 'package:flutter/material.dart';
import 'package:track_your_dollar/generated/l10n.dart';

class CategoryNameField extends StatelessWidget {
  final TextEditingController controller;

  const CategoryNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (name) {
        if (name == null || name.isEmpty) {
          return S.of(context).name_cannot_be_empty;
        }
        return null;
      },
      decoration: InputDecoration(labelText: S.of(context).name),
      keyboardType: TextInputType.text,
    );
  }
}
