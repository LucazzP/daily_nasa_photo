import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_photos/src/i18n/modules/photo_of_day/photo_of_day_i18n.dart';
import 'package:nasa_photos/src/modules/photo_of_day/widgets/photo_of_day_list/photo_of_day_list_widget.dart';
import 'package:simple_search_bar/simple_search_bar.dart';

import 'photo_of_day_controller.dart';

class PhotoOfDayPage extends StatefulWidget {
  final bool getPhotosOnOpen;
  const PhotoOfDayPage({
    Key key,
    this.getPhotosOnOpen = true,
  }) : super(key: key);

  @override
  _PhotoOfDayPageState createState() => _PhotoOfDayPageState();
}

class _PhotoOfDayPageState
    extends ModularState<PhotoOfDayPage, PhotoOfDayController> {
  //use 'controller' variable to access controller
  final appBarController = AppBarController();

  @override
  void initState() {
    if(widget.getPhotosOnOpen) controller.getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        primary: Theme.of(context).primaryColor,
        appBarController: appBarController,
        autoSelected: false,
        onChange: controller.search,
        mainAppBar: AppBar(
          title: Text("Astronomy Picture of the Day".i18n),
          actions: <Widget>[
            InkWell(
              child: Icon(
                Icons.search,
              ),
              onTap: () => appBarController.stream.add(true),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          return PhotoOfDayListWidget(
            photosList: controller.imagesList,
            onEndOfPage: controller.nextPhotosPage,
            onRefresh: controller.getPhotos,
          );
        },
      ),
    );
  }
}
