import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_photos/src/app_module.dart';
import 'package:nasa_photos/src/shared/constants/constants.dart';
import 'package:nasa_photos/src/shared/helpers/error_mapper.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

void main() {
  RunAppSnow(
    ModularApp(
      module: AppModule(),
    ),
    flavorValues: Constants.flavorDev,
    getItInit: () => Resource.setErrorMapper(ErrorMapper.from),
    flavor: Flavor.dev,
    enableDevicePreview: false,
  );
}
