import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle headingStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle currencyStyle = const TextStyle(
    color: Color.fromRGBO(80, 80, 80, 1),
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle bodyStyle = const TextStyle();

  static TextStyle subduedTextStyle = TextStyle(
    color: Colors.grey.shade800,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
}
