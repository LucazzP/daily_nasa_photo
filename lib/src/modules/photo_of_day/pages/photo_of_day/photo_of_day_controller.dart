import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/stores/photo_of_day_store.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

part 'photo_of_day_controller.g.dart';

class PhotoOfDayController = _PhotoOfDayControllerBase
    with _$PhotoOfDayController;

abstract class _PhotoOfDayControllerBase with Store {
  final PhotoOfDayStore _photoOfDayStore;

  _PhotoOfDayControllerBase(this._photoOfDayStore);

  @observable
  String valueSearch = '';

  @computed
  Resource<List<PhotoModel>> get imagesList {
    final _imagesList = _photoOfDayStore.imagesList;
    return valueSearch.isEmpty
        ? _imagesList
        : _imagesList.transformData(
            (data) => data
                .where(
                  (img) =>
                      img.title.toLowerCase().contains(valueSearch) ||
                      DateFormat("dd/MM/yyyy")
                          .format(img.date)
                          .contains(valueSearch),
                )
                .toList(),
          );
  }

  Future<void> getPhotos() {
    return _photoOfDayStore.getPhotos();
  }

  Future<void> nextPhotosPage() async {
    return _photoOfDayStore.getPhotosNextPage();
  }

  @action
  void search(String value) {
    valueSearch = value.toLowerCase();
  }
}
