import 'package:mobx/mobx.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/repositories/photo_of_day_repository.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

part 'photo_of_day_store.g.dart';

class PhotoOfDayStore = _PhotoOfDayStoreBase with _$PhotoOfDayStore;

abstract class _PhotoOfDayStoreBase with Store {
  final PhotoOfDayRepository _repository;

  _PhotoOfDayStoreBase(this._repository);

  @observable
  Resource<List<PhotoModel>> imagesList = Resource.loading();

  @action
  Future<void> getPhotos() async {
    imagesList = Resource.loading(data: imagesList?.data);
    imagesList = await _repository.getPhotosOfDay();
    return;
  }

  @action
  Future<void> getPhotosNextPage() async {
    if (imagesList.status == Status.loading) return null;
    final page = imagesList.data.length ~/ 10;
    imagesList = Resource.loading(data: imagesList?.data);
    final nextList = await _repository.getPhotosOfDay(page);
    if (nextList.status == Status.failed) {
      imagesList =
          Resource.failed(error: nextList.error, data: imagesList.data);
    } else {
      final newList = imagesList.data + nextList.data;
      imagesList = Resource.success(data: newList);
    }
    return;
  }
}
