import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/media_type.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/pages/photo_details/photo_details_page.dart';
import 'package:nasa_photos/src/modules/photo_of_day/photo_of_day_module.dart';

import '../../../../test_variants/flavors_test_variant.dart';

void main() {
  initModule(PhotoOfDayModule());
  testWidgets('PhotoDetails I18n tests', (tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        PhotoDetailsPage(
          photo: PhotoModel(
            date: DateTime.now(),
            explanation: "",
            title: "",
            url: "",
            hdurl: "",
            mediaType: MediaType.image,
          ),
        ),
      ),
    );
    expect(Translations.missingKeys, isEmpty);
    expect(Translations.missingTranslations, isEmpty);
  }, variant: FlavorsTestVariant());
}
