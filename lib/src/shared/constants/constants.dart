import 'package:nasa_photos/app_flavor_values.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

abstract class Constants {
  static AppFlavorValues get flavor => FlavorConfig.values();

  static final flavorDev = AppFlavorValues(
    baseUrl: baseUrl,
    features: () => null,
  );

  static final flavorQa = AppFlavorValues(
    baseUrl: baseUrl,
    features: () => null,
  );

  static final flavorProd = AppFlavorValues(
    baseUrl: baseUrl,
    features: () => null,
  );

  static const baseUrl = 'https://api.nasa.gov';
}

AppFlavorValues get flavor => Constants.flavor;
