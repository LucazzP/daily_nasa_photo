import 'package:flutter/material.dart';
import 'package:nasa_photos/src/styles/app_theme_data.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SnowMaterialApp(
      theme: AppThemeData.themeDataLight,
      darkTheme: AppThemeData.themeDataDark,
      themeMode: ThemeMode.system,
    );
  }
}
