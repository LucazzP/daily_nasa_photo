import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/media_type.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/pages/photo_details/photo_details_page.dart';
import 'package:nasa_photos/src/modules/photo_of_day/photo_of_day_module.dart';

import '../../../../../test_variants/flavors_test_variant.dart';

main() {
  initModule(PhotoOfDayModule());
  testWidgets('PhotoDetailsPage is showing properly the photo info', (WidgetTester tester) async {
    final photo = PhotoModel(
      date: DateTime.now(),
      explanation: "This photo is beatiful",
      title: "Nasa photo",
      hdurl: "https://flutter.dev/assets/flutter-lockup-c13da9c9303e26b8d5fc208d2a1fa20c1ef47eb021ecadf27046dea04c0cebf6.png",
      mediaType: MediaType.image,
    );

    await tester.pumpWidget(buildTestableWidget(
      PhotoDetailsPage(photo: photo),
    ));
    
    final explanationFinder = find.text(photo.explanation);
    expect(explanationFinder, findsOneWidget);

    final titleFinder = find.text(photo.title);
    expect(titleFinder, findsOneWidget);

    final dateFinder = find.text(DateFormat("dd/MM/yyyy").format(photo.date));
    expect(dateFinder, findsOneWidget);
  }, variant: FlavorsTestVariant());
}
