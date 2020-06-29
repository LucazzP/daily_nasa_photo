import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:nasa_photos/src/app_module.dart';
import 'package:nasa_photos/src/modules/photo_of_day/pages/photo_of_day/photo_of_day_page.dart';
import 'package:nasa_photos/src/modules/photo_of_day/photo_of_day_module.dart';

import '../../../../test_variants/flavors_test_variant.dart';

void main() {
  setUp(() {
    initModule(
      AppModule(),
      initialModule: true,
    );
    initModule(PhotoOfDayModule());
  });

  testWidgets('Home I18n tests', (tester) async {
    await tester.pumpWidget(buildTestableWidget(PhotoOfDayPage(
      getPhotosOnOpen: false,
    )));
    expect(Translations.missingKeys, isEmpty);
    expect(Translations.missingTranslations, isEmpty);
  }, variant: FlavorsTestVariant());
}
