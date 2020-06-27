import 'package:flutter/material.dart';
import 'package:projectbasesnow/projectbasesnow.dart';
import 'package:nasa_photos/src/styles/app_theme_data.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SnowMaterialApp(
      theme: AppThemeData.themeDataLight,
      darkTheme: AppThemeData.themeDataDark,
    );
  }
}
