import 'package:flutter/material.dart';
import 'costum_themes/text_theme.dart';
import 'costum_themes/appbar_theme.dart';
import 'costum_themes/checkbox_theme.dart';
import 'costum_themes/chip_theme.dart';
import 'costum_themes/elevated_button_theme.dart';
import 'costum_themes/outlined_button_theme.dart';
import 'costum_themes/text_field_theme.dart';

class ChindiAppTheme {
  ChindiAppTheme._();

  /// LIGHT APP THEME
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(56, 28, 114, 1),
    scaffoldBackgroundColor: Colors.white,
    textTheme: ChindiTextTheme.lightTextTheme,
    chipTheme: ChindiChipTheme.lightChipTheme,
    appBarTheme: ChindiAppBarTheme.lightAppBarTheme,
    checkboxTheme: ChindiCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: ChindiElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ChindiOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ChindiTextFormFieldTheme.lightInputDecorationTheme,
  );

  /// DARK APP THEME
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(56, 28, 114, 1),
    scaffoldBackgroundColor: Colors.black,
    textTheme: ChindiTextTheme.darkTextTheme,
    chipTheme: ChindiChipTheme.darkChipTheme,
    appBarTheme: ChindiAppBarTheme.darkAppBarTheme,
    checkboxTheme: ChindiCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: ChindiElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ChindiOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ChindiTextFormFieldTheme.darkInputDecorationTheme,
  );
}
