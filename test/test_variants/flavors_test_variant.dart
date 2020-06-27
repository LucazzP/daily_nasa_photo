import 'package:flutter_test/flutter_test.dart';
import 'package:projectbasesnow/projectbasesnow.dart';
import 'package:nasa_photos/src/shared/constants/constants.dart';

class FlavorsTestVariant implements TestVariant<FlavorConfig Function()> {
  @override
  String describeValue(FlavorConfig Function() value) {
    value();
    return FlavorConfig.name;
  }

  @override
  Future<FlavorConfig Function()> setUp(FlavorConfig Function() value) async {
    value();

    return null;
  }

  @override
  Iterable<FlavorConfig Function()> values = [
    () => FlavorConfig.tests(
          flavor: Flavor.dev,
          values: Constants.flavorDev,
        ),
    () => FlavorConfig.tests(
          flavor: Flavor.qa,
          values: Constants.flavorQa,
        ),
    () => FlavorConfig.tests(
          flavor: Flavor.production,
          values: Constants.flavorProd,
        ),
  ];

  @override
  Future<void> tearDown(
      FlavorConfig Function() value, FlavorConfig Function() memento) async {}
}
