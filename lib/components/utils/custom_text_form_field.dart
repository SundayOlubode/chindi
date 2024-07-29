import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final Widget? suffix;
  final String? Function(String?) validator;
  final bool? obscured;
  final TextEditingController? controller;
  final int? numberOfLines;
  final String? initialValue;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.validator,
    this.onChanged,
    this.controller,
    this.numberOfLines = 1,
    this.initialValue,
    this.prefixIcon,
    this.suffix,
    this.obscured,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscured ?? false,
      expands: false,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffix: suffix,
        alignLabelWithHint: true,
      ),
      maxLines: numberOfLines,
      minLines: numberOfLines,
    );
  }
}
