import 'package:flutter/foundation.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

class AppFlavorValues implements FlavorValues {
  const AppFlavorValues({
    @required this.baseUrl,
    this.anotherUrl,
    @required Map<String, bool> Function() features,
  }) : _features = features;

  final String baseUrl;
  final String anotherUrl;
  final Map<String, bool> Function() _features;
  Map<String, bool> get features => _features();
  //Add other flavor specific values, e.g database name
}
