import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final Widget? suffix;
  final String? Function(String?) validator;
  final bool? obscured;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.validator,
    required this.controller,
    this.prefixIcon,
    this.suffix,
    this.obscured,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscured ?? false,
      expands: false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffix: suffix,
      ),
    );
  }
}
