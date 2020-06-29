import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/media_type.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/widgets/photo_tile/photo_tile_widget.dart';

import '../../../../../test_variants/flavors_test_variant.dart';

main() {
  testWidgets('PhotoTileWidget is showing properly the photo info', (WidgetTester tester) async {
    final photo = PhotoModel(
      date: DateTime.now(),
      explanation: "This photo is beatiful",
      title: "Nasa photo",
      hdurl: "",
      mediaType: MediaType.image,
    );

    await tester.pumpWidget(buildTestableWidget(
      Material(
        child: PhotoTileWidget(
          photo: photo,
        ),
      ),
    ));
    
    final titleFinder = find.text(photo.title);
    expect(titleFinder, findsOneWidget);

    final dateFinder = find.text(DateFormat("dd/MM/yyyy").format(photo.date));
    expect(dateFinder, findsOneWidget);
  }, variant: FlavorsTestVariant());
}
