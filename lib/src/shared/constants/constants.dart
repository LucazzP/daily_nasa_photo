import 'package:projectbasesnow/projectbasesnow.dart';

import 'package:nasa_photos/app_flavor_values.dart';
import 'features.dart';

abstract class Constants {
  static AppFlavorValues get flavor => FlavorConfig.values();

  static final flavorDev = AppFlavorValues(
    baseUrl: localhost,
    features: () => Features.devRemote,
  );

  static final flavorQa = AppFlavorValues(
    baseUrl: localhost,
    features: () => Features.qaRemote,
  );

  static final flavorProd = AppFlavorValues(
    baseUrl: localhost,
    features: () => Features.prodRemote,
  );

  static const localhost = 'http://10.0.2.2:1337';
}

AppFlavorValues get flavor => Constants.flavor;
