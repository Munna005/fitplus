import 'package:fitplus/pallete.dart';
import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const TextInputForm({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Pallette.backgroundColor),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Pallette.backgroundColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallette.backgroundColor),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
