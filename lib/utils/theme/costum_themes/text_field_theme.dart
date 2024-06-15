import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class ChindiTextFormFieldTheme {
  ChindiTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ChindiColors.darkGrey,
    suffixIconColor: ChindiColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: ChindiSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ChindiSizes.fontSizeMd, color: ChindiColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ChindiSizes.fontSizeSm, color: ChindiColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ChindiColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: ChindiColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ChindiColors.darkGrey,
    suffixIconColor: ChindiColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: ChindiSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ChindiSizes.fontSizeMd, color: ChindiColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ChindiSizes.fontSizeSm, color: ChindiColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ChindiColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ChindiColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ChindiSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: ChindiColors.warning),
    ),
  );
}
