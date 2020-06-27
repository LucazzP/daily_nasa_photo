import 'package:password_strength/password_strength.dart';
import 'package:string_validator/string_validator.dart';
import '../../i18n/validators_i18n.dart';

abstract class Validators {
  static String string({String value, String message}) {
    return value.isNotEmpty ? null : message;
  }

  static String fullName(String value) {
    final list = value.split(" ");

    if (value.isEmpty) {
      return "O nome não pode ser vazio".i18n;
    } else if (list.length == 1) {
      return "Digite o nome completo".i18n;
    } else {
      return null;
    }
  }

  static String phone(String value) {
    if (value.isEmpty) {
      return "O número do celular não pode ser vazio".i18n;
    }

    final split = value
        .replaceAll(" ", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("-", "");
    if (split.length == 11) {
      return null;
    } else {
      return "Número inválido".i18n;
    }
  }

  static String email(String email) {
    if (email.isEmpty) {
      return "O e-mail não pode ser vazio".i18n;
    } else if (isEmail(email)) {
      return null;
    } else {
      return "Digite um e-mail válido".i18n;
    }
  }

  static String password(String password) {
    if (password.isEmpty) {
      return "A senha não pode ser vazia".i18n;
    }

    final strength = estimatePasswordStrength(password);
    if (strength < 0.3) {
      return "Senha fraca, tente uma mais forte".i18n;
    } else {
      return null;
    }
  }

  static String creditCardNumber(String value) {
    if (value.isEmpty) {
      return "O número do cartão não pode ser vazio".i18n;
    }
    if (isCreditCard(value)) {
      return null;
    } else {
      return "Digite um cartão válido".i18n;
    }
  }

  static String creditCardCCV(String value) {
    if (value.isEmpty) {
      return "Não pode ser vazio".i18n;
    }
    if (value.length == 3) {
      return null;
    } else {
      return "Digite um CCV válido".i18n;
    }
  }

  static String creditCardDate(String value) {
    if (value.isEmpty) {
      return "Não pode ser vazio".i18n;
    }

    final split = value.split("/");
    final month = int.parse(split[0]);
    final year = int.parse("20${split[1]}");
    final date = DateTime.now();
    if (year >= date.year) {
      if (month <= 12 && month >= date.month) {
        return null;
      } else {
        return "Data inválida".i18n;
      }
    } else {
      return "Data inválida".i18n;
    }
  }
}
