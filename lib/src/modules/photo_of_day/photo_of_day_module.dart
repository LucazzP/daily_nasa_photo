import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:nasa_photos/src/modules/photo_of_day/pages/photo_details/photo_details_page.dart';
import 'package:nasa_photos/src/modules/photo_of_day/pages/photo_of_day/photo_of_day_controller.dart';
import 'package:nasa_photos/src/modules/photo_of_day/pages/photo_of_day/photo_of_day_page.dart';
import 'package:nasa_photos/src/modules/photo_of_day/repositories/photo_of_day_repository_impl.dart';
import 'package:nasa_photos/src/modules/photo_of_day/stores/photo_of_day_store.dart';

class PhotoOfDayModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PhotoOfDayController(i())),
        Bind((i) => PhotoOfDayStore(i())),
        Bind((i) => PhotoOfDayRepositoryImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => I18n(
            child: PhotoOfDayPage(),
          ),
        ),
        ModularRouter(
          '/details',
          child: (_, args) => PhotoDetailsPage(
            photo: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<PhotoOfDayModule>.of();
}
