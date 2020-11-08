import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/media_type.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/widgets/photo_of_day_list/photo_of_day_list_widget.dart';
import 'package:nasa_photos/src/modules/photo_of_day/widgets/photo_tile/photo_tile_widget.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

import '../../../../../test_variants/flavors_test_variant.dart';

main() {
  final listPhotos = [
    PhotoModel(
      date: DateTime(2020, 06, 28),
      explanation: "This photo is beatiful",
      title: "Nasa photo",
      hdurl: "",
      mediaType: MediaType.image,
    ),
    PhotoModel(
      date: DateTime(2020, 06, 27),
      explanation: "This photo is beatiful 2",
      title: "Nasa photo 2",
      thumbnailUrl: "",
      mediaType: MediaType.video,
    )
  ];

  group('PhotoOfDayListWidget is showing properly the list of photos', () {
    testWidgets('Render - Success - With data', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        Material(
          child: PhotoOfDayListWidget(
            photosList: Resource.success(data: listPhotos),
            onEndOfPage: () {},
            onRefresh: () {},
          ),
        ),
      ));

      final findScrollBar = find.byType(Scrollbar);
      final findTile1 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo == listPhotos[0],
      );
      final findTile2 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo == listPhotos[1],
      );

      final findLoadingTiles = find.byWidgetPredicate(
        (widget) =>
            widget is PhotoTileWidget &&
            widget.photo == null &&
            widget.onTap == null &&
            widget.isLoading,
      );

      expect(findScrollBar, findsOneWidget);
      expect(findTile1, findsOneWidget);
      expect(findTile2, findsOneWidget);
      expect(findLoadingTiles, findsNWidgets(3));
    }, variant: FlavorsTestVariant());

    testWidgets('Render - Success - No data', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        Material(
          child: PhotoOfDayListWidget(
            photosList: Resource.success(),
            onEndOfPage: () {},
            onRefresh: () {},
          ),
        ),
      ));

      final findScrollView = find.byWidgetPredicate(
        (widget) =>
            widget is SingleChildScrollView &&
            widget.physics is AlwaysScrollableScrollPhysics,
      );
      final findTextNoImages = find.text("We don't have images to show :(");
      final findTile1 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo != null,
      );

      final findLoadingTiles = find.byWidgetPredicate(
        (widget) =>
            widget is PhotoTileWidget &&
            widget.photo == null &&
            widget.onTap == null &&
            widget.isLoading,
      );

      expect(findScrollView, findsOneWidget);
      expect(findTextNoImages, findsOneWidget);
      expect(findTile1, findsNothing);
      expect(findLoadingTiles, findsNothing);
    }, variant: FlavorsTestVariant());

    testWidgets('Render - Failed - With data', (WidgetTester tester) async {
      final error = AppException(message: "Ocorreu um erro");
      await tester.pumpWidget(buildTestableWidget(
        Material(
          child: PhotoOfDayListWidget(
            photosList: Resource.failed(
              data: listPhotos,
              error: error,
            ),
            onEndOfPage: () {},
            onRefresh: () {},
          ),
        ),
      ));

      final findScrollBar = find.byType(Scrollbar);
      final findTile1 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo == listPhotos[0],
      );
      final findTile2 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo == listPhotos[1],
      );

      final findLoadingTiles = find.byWidgetPredicate(
        (widget) =>
            widget is PhotoTileWidget &&
            widget.photo == null &&
            widget.onTap == null &&
            widget.isLoading,
      );

      final findErrorWidget = find.text(error.message);

      expect(findScrollBar, findsOneWidget);
      expect(findTile1, findsOneWidget);
      expect(findTile2, findsOneWidget);
      expect(findLoadingTiles, findsNothing);
      expect(findErrorWidget, findsOneWidget);
    }, variant: FlavorsTestVariant());

    testWidgets('Render - Failed - No data', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        Material(
          child: PhotoOfDayListWidget(
            photosList: Resource.failed(),
            onEndOfPage: () {},
            onRefresh: () {},
          ),
        ),
      ));

      final findScrollView = find.byWidgetPredicate(
        (widget) =>
            widget is SingleChildScrollView &&
            widget.physics is AlwaysScrollableScrollPhysics,
      );
      final findTile1 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo != null,
      );

      final findLoadingTiles = find.byWidgetPredicate(
        (widget) =>
            widget is PhotoTileWidget &&
            widget.photo == null &&
            widget.onTap == null &&
            widget.isLoading,
      );

      expect(findScrollView, findsOneWidget);
      expect(findTile1, findsNothing);
      expect(findLoadingTiles, findsNothing);
    }, variant: FlavorsTestVariant());

    testWidgets('Render - Loading - With data', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        Material(
          child: PhotoOfDayListWidget(
            photosList: Resource.loading(
              data: listPhotos,
            ),
            onEndOfPage: () {},
            onRefresh: () {},
          ),
        ),
      ));

      final findScrollBar = find.byType(Scrollbar);
      final findTile1 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo == listPhotos[0],
      );
      final findTile2 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo == listPhotos[1],
      );

      final findLoadingTiles = find.byWidgetPredicate(
        (widget) =>
            widget is PhotoTileWidget &&
            widget.photo == null &&
            widget.onTap == null &&
            widget.isLoading,
      );

      expect(findScrollBar, findsOneWidget);
      expect(findTile1, findsOneWidget);
      expect(findTile2, findsOneWidget);
      expect(findLoadingTiles, findsNWidgets(3));
    }, variant: FlavorsTestVariant());

    testWidgets('Render - Loading - No data', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(
        Material(
          child: PhotoOfDayListWidget(
            photosList: Resource.loading(),
            onEndOfPage: () {},
            onRefresh: () {},
          ),
        ),
      ));

      final findListViewLoading = find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.physics is ClampingScrollPhysics,
      );
      final findTile1 = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.photo != null,
      );

      final findLoadingTiles = find.byWidgetPredicate(
        (widget) => widget is PhotoTileWidget && widget.isLoading,
      );

      expect(findListViewLoading, findsOneWidget);
      expect(findTile1, findsNothing);
      expect(findLoadingTiles, findsWidgets);
    }, variant: FlavorsTestVariant());
  });
}
