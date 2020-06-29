import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:nasa_photos/src/i18n/modules/photo_of_day/photo_of_day_i18n.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/widgets/photo_tile/photo_tile_widget.dart';
import 'package:projectbasesnow/models/status.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

class PhotoOfDayListWidget extends StatelessWidget {
  PhotoOfDayListWidget({
    Key key,
    this.photosList,
    this.onRefresh,
    this.onEndOfPage,
  })  : _images = photosList?.data,
        super(key: key);

  final Resource<List<PhotoModel>> photosList;
  final void Function() onRefresh;
  final void Function() onEndOfPage;
  final List<PhotoModel> _images;

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (photosList.status) {
      case Status.loading:
        child = _images == null
            ? _LoadingList()
            : _ListWidget(
                images: _images,
                endWidget: _LoadingList(),
              );
        break;
      case Status.failed:
        final error = photosList.error.message;
        child = _images == null
            ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  child: Text(error ?? ""),
                ),
              )
            : _ListWidget(
                images: _images,
                endWidget: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(error ?? ""),
                ),
              );
        break;
      case Status.success:
        child = _ListWidget(
          images: _images,
          endWidget: _LoadingList(),
        );
        break;
    }

    return LazyLoadRefreshIndicator(
      onRefresh: onRefresh,
      scrollOffset: 600,
      onEndOfPage: onEndOfPage,
      child: child,
    );
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget({
    Key key,
    @required this.images,
    @required this.endWidget,
  }) : super(key: key);

  final List<PhotoModel> images;
  final Widget endWidget;

  @override
  Widget build(BuildContext context) {
    return images == null || images.isEmpty
        ? SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              height: 250,
              alignment: Alignment.center,
              child: Text("We don't have images to show :(".i18n),
            ),
          )
        : Scrollbar(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index];
                final tileWidget = PhotoTileWidget(
                  photo: image,
                  onTap: () =>
                      Modular.to.pushNamed("/details", arguments: image),
                );
                if (index + 1 == images.length) {
                  return Column(
                    children: [
                      tileWidget,
                      endWidget,
                    ],
                  );
                }
                return tileWidget;
              },
            ),
          );
  }
}

class _LoadingList extends StatelessWidget {
  const _LoadingList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: const [
        PhotoTileWidget.loading(),
        PhotoTileWidget.loading(),
        PhotoTileWidget.loading(),
      ],
    );
  }
}
