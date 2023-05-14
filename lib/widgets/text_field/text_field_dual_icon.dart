import 'package:flutter/material.dart';

class TextFieldDualIcons extends StatelessWidget {
  final dynamic icon;
  final dynamic icon2;
  final String? hintText;
  final Function onSubmitted;
  final Function onPressIcon;

  const TextFieldDualIcons(
      {super.key,
      required this.icon,
      required this.icon2,
      this.hintText,
      required this.onSubmitted,
      required this.onPressIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        prefixIcon: icon,
        suffixIcon: IconButton(
          icon: icon2,
          onPressed: onPressIcon(),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      onSubmitted: (value) {
        onSubmitted(value);
      },
    );
  }
}
