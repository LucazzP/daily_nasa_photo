import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:nasa_photos/app_flavor_values.dart';
import 'package:nasa_photos/src/shared/clients/dio_client.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

void main() {
  DioClient dio;

  setUp(() {
    FlavorConfig(
      flavor: Flavor.production,
      values: AppFlavorValues(
        baseUrl: "",
        features: null,
      ),
    );
    dio = DioClient();
  });

  test('Dio client test', () async {
    final resObservable = dio.get("wrongPath").asObservable();
    expect(resObservable, isNotNull);
    expect(resObservable.status, FutureStatus.pending);
    final res = await resObservable.catchError((e) {});
    expect(resObservable.status, FutureStatus.rejected);
    expect(res, isNull);
  });
}
