import 'package:flutter/material.dart';
import 'package:midterm_exam/app/global/constants/colors.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final Color? color;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final bool hasIcon;
  const SecondaryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.color = lightPrimaryColor,
    this.padding = const EdgeInsets.all(16),
    this.fontSize = 18,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: hasIcon ? outlinedButtonIcon() : outlinedButton(),
    );
  }

  Widget outlinedButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        padding: padding,
        side: BorderSide(
          color: onPressed == null ? color!.withOpacity(0.25) : color!,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        textStyle: TextStyle(
          fontSize: fontSize,
          color: onPressed == null ? color!.withOpacity(0.25) : color,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  Widget outlinedButtonIcon() {
    return OutlinedButton.icon(
      icon: const Icon(Icons.refresh_rounded),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        padding: padding,
        side: BorderSide(
          color: onPressed == null ? color!.withOpacity(0.25) : color!,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        textStyle: TextStyle(
          fontSize: fontSize,
          color: onPressed == null ? color!.withOpacity(0.25) : color,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
