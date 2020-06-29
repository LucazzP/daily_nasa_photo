import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_photos/src/shared/widgets/shimmer/shimmer_widget.dart';
import 'package:nasa_photos/src/styles/app_color_scheme.dart';
import 'package:shimmer/shimmer.dart';

main() {
  testWidgets('ShimmerWidget is rendering the correct colors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ShimmerWidget()));

    final findShimmer = find.byType(Shimmer);
    expect(findShimmer, findsOneWidget);

    final shimmer = tester.firstWidget(findShimmer);
    final findBaseColor = (shimmer as Shimmer).gradient.colors[0];
    final findHighLightColor = (shimmer as Shimmer).gradient.colors[2];
    expect(findBaseColor, AppColorScheme.primarySwatch);
    expect(findHighLightColor, AppColorScheme.accentColor);
  });
}
