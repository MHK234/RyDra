import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isNumber;
  final bool isPassword;

  const InputField({
    super.key,
    required this.hint,
    required this.controller,
    required this.isNumber,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.number : TextInputType.name,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFBDBDBD)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2E4E6F)),
        ),
      ),
    );
  }
}
