import 'package:i18n_extension/i18n_extension.dart';

/// For more info, see: https://pub.dartlang.org/packages/i18n_extension
extension PhotoOfDayLocalization on String {
  static var t = Translations("en_us") +
      {
        "en_us": "Astronomy Picture of the Day",
        "pt_br": "Imagem do dia da astronomia",
      } +
      {
        "en_us": "We don't have images to show :(",
        "pt_br": "Não há nenhuma imagem disponível :(",
      };

  String get i18n => localize(this, t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, t);

  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
