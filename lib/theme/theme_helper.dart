import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';
 LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    PrefUtils().setThemeData(newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 18.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.gray80002,
          fontSize: 24.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 20.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = const ColorScheme.light(
    primary: Color.fromRGBO(212, 157, 47, 1),//Color(0XFF696969),
    primaryContainer: Color(0XFF0013B8),
    onPrimary:  Color.fromRGBO(212, 157, 47, 1),//Color(0XFF1D0093),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => const Color(0XFF000000);
// Blue
  Color get blue50 => const Color(0XFFD2E4FF);
  Color get blueA100 => const Color(0XFF91B3FA);
// BlueGray
  Color get blueGray400 => const Color.fromRGBO(212, 157, 47, 1);//Color(0XFF888888);
// DeepPurple
  Color get deepPurpleA700 => const Color.fromRGBO(212, 157, 47, 1);
// Gray
  Color get gray800 => const Color(0XFF444444);
  Color get gray80002 => const Color(0XFF3E3E3E);
// Green
  Color get greenA700 => const Color(0XFF00C107);
// White
  Color get whiteA700 => const Color(0XFFFFFFFF);

  get primaryColor => null;
}
