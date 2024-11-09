import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
// Gradient decorations
  static BoxDecoration get gradientOnPrimaryToDeepPurpleA => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [theme.colorScheme.onPrimary, appTheme.deepPurpleA700],
        ),
      );
// Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.07),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              0,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack900 => const BoxDecoration();
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL10 => BorderRadius.vertical(
        top: Radius.circular(10.h),
      );
  static BorderRadius get customBorderTL101 => BorderRadius.horizontal(
        left: Radius.circular(10.h),
      );
// Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder22 => BorderRadius.circular(
        22.h,
      );
}
