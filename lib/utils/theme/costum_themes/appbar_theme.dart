import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class ChindiAppBarTheme {
  ChindiAppBarTheme._();

  /// Light App Bar Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: ChindiColors.black, size: ChindiSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ChindiColors.black, size: ChindiSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: ChindiColors.black),
  );

  /// Dark App Bar Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: ChindiColors.black, size: ChindiSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ChindiColors.white, size: ChindiSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: ChindiColors.white),
  );
}