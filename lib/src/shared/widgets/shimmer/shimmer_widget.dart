import 'package:flutter/material.dart';
import 'package:nasa_photos/src/styles/app_color_scheme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorScheme.primarySwatch,
      highlightColor: AppColorScheme.accentColor,
      loop: 10,
      child: Container(
        padding: EdgeInsets.all(30),
        width: 1,
        height: 1,
        color: AppColorScheme.accentColor,
      ),
    );
  }
}
