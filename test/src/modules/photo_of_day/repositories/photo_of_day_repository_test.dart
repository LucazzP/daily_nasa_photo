import 'package:flutter_snow_base/flutter_snow_base.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/modules/photo_of_day/repositories/photo_of_day_repository.dart';

main() {
  PhotoOfDayRepository _repo;

  setUp(() {
    _repo = PhotoOfDayRepositoryMock();
  });

  group('PhotoOfDayRepository is working properly', () {
    test(
        'getPhotosOfDay function is returning the first page and parsing correctely the json (page 0)',
        () async {
      final photos = await _repo.getPhotosOfDay(0);

      expect(photos.status, equals(Status.success));

      expect(photos.data, isList);
      expect(photos.data.length, equals(10));
      expect(photos.data.first, isA<PhotoModel>());
      expect(photos.data.first.date, equals(DateTime(2020, 11, 08)));
      expect(photos.data.last.date, equals(DateTime(2020, 10, 30)));
    });

    test(
        'getPhotosOfDay function is returning the second page and parsing correctely the json (page 1)',
        () async {
      final photos = await _repo.getPhotosOfDay(1);

      expect(photos.status, equals(Status.success));

      expect(photos.data, isList);
      expect(photos.data.length, equals(10));
      expect(photos.data.first, isA<PhotoModel>());
      expect(photos.data.first.date, equals(DateTime(2020, 10, 29)));
      expect(photos.data.last.date, equals(DateTime(2020, 10, 20)));
    });

    test(
        'getPhotosOfDay function is returning the third page and parsing correctely the json (page 2)',
        () async {
      final photos = await _repo.getPhotosOfDay(2);

      expect(photos.status, equals(Status.success));

      expect(photos.data, isList);
      expect(photos.data.length, equals(10));
      expect(photos.data.first, isA<PhotoModel>());
      expect(photos.data.first.date, equals(DateTime(2020, 10, 19)));
      expect(photos.data.last.date, equals(DateTime(2020, 10, 10)));
    });
  });
}
