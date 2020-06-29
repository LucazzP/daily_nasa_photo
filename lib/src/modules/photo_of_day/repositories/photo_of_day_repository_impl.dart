import 'package:intl/intl.dart';
import 'package:nasa_photos/src/modules/photo_of_day/models/photo_model.dart';
import 'package:nasa_photos/src/shared/clients/dio_client.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

import 'photo_of_day_repository.dart';

class PhotoOfDayRepositoryImpl implements PhotoOfDayRepository {
  final DioClient _dio;

  PhotoOfDayRepositoryImpl(this._dio);

  @override
  Future<Resource<List<PhotoModel>>> getPhotosOfDay([int page = 0]) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final endDateTime = DateTime.now().subtract(
      Duration(days: 10 * page + page),
    );
    final endDate = dateFormat.format(endDateTime);
    final startDate = dateFormat.format(
      endDateTime.subtract(
        Duration(days: 10),
      ),
    );

    final result = NetworkBoundResources<List<PhotoModel>, List>().asFuture(
      createCall: () => _dio.get<List>(
        "/planetary/apod?api_key=Fty80HkuF2LSDWPVutz34KJ4MXh9JWWKo8degZO4&thumbs=true&start_date=$startDate&end_date=$endDate",
      ),
      processResponse: (result) => result
          .map<PhotoModel>((e) => PhotoModel.fromJson(Map.from(e)))
          .toList()
          .reversed
          .toList(),
    );
    return result;
  }
}
