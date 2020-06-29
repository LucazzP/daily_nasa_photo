import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/shared/widgets/shimmer/shimmer_widget.dart';
import 'package:nasa_photos/src/styles/app_color_scheme.dart';

class PhotoTileWidget extends StatelessWidget {
  final PhotoModel photo;
  final void Function() onTap;
  final bool isLoading;

  const PhotoTileWidget({Key key, this.photo, this.onTap})
      : isLoading = false,
        super(key: key);

  const PhotoTileWidget.loading({Key key})
      : photo = null,
        onTap = null,
        isLoading = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColorScheme.primarySwatch,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: isLoading
                      ? ShimmerWidget()
                      : Hero(
                          tag: photo.imageUrl,
                          child: CachedNetworkImage(
                            imageUrl: photo.imageUrl,
                            fit: BoxFit.cover,
                            key: Key(photo.imageUrl),
                            placeholder: (context, url) => ShimmerWidget(),
                          ),
                        ),
                ),
                _InfoBox(
                  title: photo?.title,
                  date: photo?.date,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox({
    Key key,
    this.title = '',
    this.date,
  }) : super(key: key);

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: AppColorScheme.accentColor.withOpacity(.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title ?? '',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              date == null ? '' : DateFormat("dd/MM/yyyy").format(date),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
