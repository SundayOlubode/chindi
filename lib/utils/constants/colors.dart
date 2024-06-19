import 'package:flutter/material.dart';

class ChindiColors {
  ChindiColors._();

  // App theme colors
  static Color primary = const Color.fromRGBO(56, 28, 114, 1);
  static const Color secondary = Color.fromRGBO(51, 51, 51, 1);
  static const Color accent = Color(0xFFb0c7ff);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = ChindiColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = Color.fromRGBO(56, 28, 114, 1);
  static const Color buttonSecondary = Color.fromRGBO(51, 51, 51, 1);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // User Profile Colors
  static const Color logoutBkgrdColor = Color(0xFFFFD4D4);
  static const Color logoutTextColor = Color(0xFF5E0000);
}
