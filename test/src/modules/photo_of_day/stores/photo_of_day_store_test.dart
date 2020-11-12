import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/repositories/photo_of_day_repository.dart';
import 'package:nasa_photos/src/modules/photo_of_day/stores/photo_of_day_store.dart';

main() {
  PhotoOfDayStore _store;

  setUp(() {
    _store = PhotoOfDayStore(PhotoOfDayRepositoryMock());
  });

  group('PhotoOfDayStore is working properly', () {
    Future<void> getPhotosTest1() async {
      expect(_store.imagesList.data, equals(null));
      expect(_store.imagesList.status, equals(Status.loading));

      await _store.getPhotos();

      expect(_store.imagesList.data.length, equals(10));
      expect(_store.imagesList.status, equals(Status.success));
    }

    test(
      'getPhotos function is saving correctly the imagesList',
      getPhotosTest1,
    );

    test(
        'getPhotosNextPage function is getting correctly the next page and adding to the list',
        () async {
      await getPhotosTest1();

      await _store.getPhotosNextPage();

      expect(_store.imagesList.data.length, equals(20));
      expect(_store.imagesList.status, equals(Status.success));

      await _store.getPhotosNextPage();

      expect(_store.imagesList.data.length, equals(30));
      expect(_store.imagesList.status, equals(Status.success));
    });
  });
}
