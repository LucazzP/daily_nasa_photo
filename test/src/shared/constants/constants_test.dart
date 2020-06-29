import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_photos/src/shared/constants/constants.dart';

void main() {
  test('Constants test', () async {
    expect(Constants.flavorDev.baseUrl, isNotEmpty);
    expect(Constants.flavorQa.baseUrl, isNotEmpty);
    expect(Constants.flavorProd.baseUrl, isNotEmpty);
  });
}
