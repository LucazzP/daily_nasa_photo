import 'package:i18n_extension/i18n_extension.dart';

/// For more info, see: https://pub.dartlang.org/packages/i18n_extension
extension HomeLocalization on String {
  static var t = Translations("pt_br") +
      {
        "pt_br": "Olá mundo",
        "en_us": "Hello World",
      };

  String get i18n => localize(this, t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, t);

  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
