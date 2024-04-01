import 'package:flutter/material.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor = primaryColor,
    this.padding = const EdgeInsets.all(16),
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: white,
          disabledBackgroundColor: backgroundColor!.withOpacity(0.5),
          padding: padding,
          textStyle: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
