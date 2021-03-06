import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_photos/src/app_module.dart';
import 'package:nasa_photos/src/shared/constants/constants.dart';
import 'package:nasa_photos/src/shared/helpers/error_mapper.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

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
