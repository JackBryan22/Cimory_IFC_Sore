import 'package:flutter/material.dart';

class SignInput extends StatelessWidget {
  final String label;
  final Icon prefixIcon;

  const SignInput({super.key, required this.label, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        labelText: label,
        floatingLabelStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIconColor: Colors.white,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
