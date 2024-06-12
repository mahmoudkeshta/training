import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyLargeGray80002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray80002,
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodySmallGray80002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80002,
      );
  static get bodySmallGray8000210 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80002,
        fontSize: 10.fSize,
      );
  static get bodySmallGray800028 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80002,
        fontSize: 8.fSize,
      );
  static get bodySmallGray80002Light => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80002,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w300,
      );
// Label text style
  static get labelLargeGray80002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80002,
      );
  static get labelLargeGray80002Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80002,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumOnPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
}
