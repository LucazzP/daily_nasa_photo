import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_photos/src/i18n/modules/photo_of_day/photo_details_i18n.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/shared/widgets/shimmer/shimmer_widget.dart';
import 'package:nasa_photos/src/styles/app_text_theme.dart';

class PhotoDetailsPage extends StatelessWidget {
  final PhotoModel photo;
  const PhotoDetailsPage({Key key, @required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title ?? ""),
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Hero(
              tag: photo.imageUrl,
              child: CachedNetworkImage(
                imageUrl: photo.imageUrl,
                fit: BoxFit.cover,
                key: Key(photo.imageUrl),
                placeholder: (context, url) => ShimmerWidget(),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Explanation:".i18n,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.textTheme.headline6,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        DateFormat("dd/MM/yyyy").format(photo.date),
                        style: AppTextTheme.textTheme.headline6,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    photo.explanation,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
