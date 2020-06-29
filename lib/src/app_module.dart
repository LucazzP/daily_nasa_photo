import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_photos/src/shared/clients/dio_client.dart';

import 'app_widget.dart';
import 'modules/photo_of_day/photo_of_day_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DioClient()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: PhotoOfDayModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
