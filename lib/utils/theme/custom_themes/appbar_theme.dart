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
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Color.fromRGBO(30, 30, 30, 1),
      size: ChindiSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: ChindiColors.black,
      size: ChindiSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      color: Color.fromRGBO(30, 30, 30, 1),
    ),
  );

  /// Dark App Bar Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Color.fromRGBO(30, 30, 30, 1),
      size: ChindiSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: ChindiColors.white,
      size: ChindiSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      color: Color.fromRGBO(30, 30, 30, 1),
    ),
  );
}
