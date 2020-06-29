import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppColorScheme {
  static ColorScheme get colorScheme =>
      AppThemeData.isDark ? colorSchemeDark : colorSchemeLight;

  static final ColorScheme colorSchemeLight = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: Color(0xff32353D),
    accentColor: accentColor,
    primarySwatch: primarySwatch,
  );

  static final ColorScheme colorSchemeDark = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: Color(0xff32353D),
    accentColor: accentColor,
    primarySwatch: primarySwatch,
  );

  /// http://mcg.mbitson.com/
  static final MaterialColor primarySwatch =
      MaterialColor(0xFF394362, <int, Color>{
    50: Color(0xFFE7E8EC),
    100: Color(0xFFC4C7D0),
    200: Color(0xFF9CA1B1),
    300: Color(0xFF747B91),
    400: Color(0xFF575F7A),
    500: Color(0xFF394362),
    600: Color(0xFF333D5A),
    700: Color(0xFF2C3450),
    800: Color(0xFF242C46),
    900: Color(0xFF171E34),
  });

  static const MaterialColor accentColor =
      MaterialColor(0xFF4369FF, <int, Color>{
    100: Color(0xFF7691FF),
    200: Color(0xFF4369FF),
    400: Color(0xFF1040FF),
    700: Color(0xFF0031F6),
  });

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
}
