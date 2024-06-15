import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class ChindiOutlinedButtonTheme {
  ChindiOutlinedButtonTheme._(); //To avoid creating instances

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ChindiColors.dark,
      side: const BorderSide(color: ChindiColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: ChindiColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: ChindiSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ChindiSizes.buttonRadius)),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ChindiColors.light,
      side: const BorderSide(color: ChindiColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16,
          color: ChindiColors.textWhite,
          fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: ChindiSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ChindiSizes.buttonRadius)),
    ),
  );
}
