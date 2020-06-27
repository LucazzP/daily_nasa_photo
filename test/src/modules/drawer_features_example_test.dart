import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projectbasesnow/projectbasesnow.dart';
import 'package:nasa_photos/src/app_module.dart';
//import 'package:nasa_photos/app/widgets/drawer/drawer_widget.dart';

import '../../test_variants/flavors_test_variant.dart';

main() {
  setUp(() {
    initModule(AppModule(), initialModule: true);
  });

  group('DrawerWidget has correct features activated on each env', () {
    testWidgets('', (tester) async {
      //await tester.pumpWidget(buildTestableWidget(DrawerWidget()));

      //final feature1 = find.byKey(Key('feature_1'));
      //if(FlavorConfig.isQA){
      //  expect(feature1, findsNothing);
      //} else {
      //  expect(feature1, findsOneWidget);
      //}

      //final feature2 = find.byKey(Key('feature_2'));
      //if(FlavorConfig.isProduction) {
      //  expect(feature2, findsNothing);
      //} else  {
      //  expect(feature2, findsOneWidget);
      //}

      //final logout = find.byKey(Key('logout'));
      //expect(logout, findsOneWidget);
    }, variant: FlavorsTestVariant());
  });
}
