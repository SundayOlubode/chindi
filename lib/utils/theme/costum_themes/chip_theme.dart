import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ChindiChipTheme {
  ChindiChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ChindiColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: ChindiColors.black),
    selectedColor: ChindiColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ChindiColors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ChindiColors.darkerGrey,
    labelStyle: const TextStyle(color: ChindiColors.white),
    selectedColor: ChindiColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ChindiColors.white,
  );
}
