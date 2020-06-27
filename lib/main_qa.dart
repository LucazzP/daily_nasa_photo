import 'package:flutter_modular/flutter_modular.dart';
import 'package:projectbasesnow/projectbasesnow.dart';
import 'package:nasa_photos/src/app_module.dart';
import 'package:nasa_photos/src/shared/constants/constants.dart';
import 'package:nasa_photos/src/shared/helpers/error_mapper.dart';

void main() {
  RunAppSnow(
    ModularApp(
      module: AppModule(),
    ),
    flavorValues: Constants.flavorQa,
    getItInit: () => Resource.setErrorMapper(ErrorMapper.from),
    flavor: Flavor.qa,
  );
}