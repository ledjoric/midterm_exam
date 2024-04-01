import 'package:flutter/material.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int? maxLength;

  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    required this.hintText,
    this.onChanged,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        color: labelPurple,
      ),
      maxLength: maxLength,
      decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFD9D9D9),
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: labelPurple.withOpacity(0.5),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
