import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Chindi Elevated Button Theme
class ChindiElevatedButtonTheme {
  ChindiElevatedButtonTheme._(); //To avoid creating instances

  /// Light Theme - Elevation Button
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ChindiColors.primary,
      disabledForegroundColor: ChindiColors.darkGrey,
      disabledBackgroundColor: ChindiColors.buttonDisabled,
      padding: const EdgeInsets.all(
        10,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: ChindiColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  /// Dark Theme - Elevation Button
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ChindiColors.primary,
      disabledForegroundColor: ChindiColors.darkGrey,
      disabledBackgroundColor: ChindiColors.darkerGrey,
      side: BorderSide(
        color: ChindiColors.primary,
      ),
      padding: const EdgeInsets.all(
        10,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: ChindiColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ChindiSizes.buttonRadius,
        ),
      ),
    ),
  );
}
