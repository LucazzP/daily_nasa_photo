import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

abstract class PhotoOfDayRepository {
  Future<Resource<List<PhotoModel>>> getPhotosOfDay([int page = 0]);
}
