import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

import 'app_bar_theme_app.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

/// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
class AppThemeData extends ThemeDataSnow {
  static bool get isDark => ThemeDataSnow.isDark;

  static ThemeData get themeData =>
      ThemeDataSnow.isDark ? themeDataDark : themeDataLight;

  static final ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: AppColorScheme.primarySwatch,
    accentColor: AppColorScheme.accentColor,
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarThemeApp.appBarTheme,
    colorScheme: AppColorScheme.colorSchemeLight,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatch[500],
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorSchemeLight,
        textTheme: ButtonTextTheme.primary),
  );

  static final ThemeData themeDataDark = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primarySwatch: AppColorScheme.primarySwatch,
    accentColor: AppColorScheme.accentColor,
    textTheme: AppTextTheme.textTheme,
    appBarTheme: AppBarThemeApp.appBarTheme,
    colorScheme: AppColorScheme.colorSchemeDark,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatch[500],
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorSchemeDark,
        textTheme: ButtonTextTheme.primary),
  );
}
