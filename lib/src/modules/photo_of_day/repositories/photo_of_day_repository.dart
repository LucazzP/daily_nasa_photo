import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

abstract class PhotoOfDayRepository {
  Future<Resource<List<PhotoModel>>> getPhotosOfDay([int page = 0]);
}
