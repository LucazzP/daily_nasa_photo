import 'package:dio/dio.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart';

class ErrorMapper {
  static AppException from(Exception e) {
    return e is DioError
        ? AppException(
            exception: e,
            message: _dioError(e),
          )
        : e is AppException
            ? e
            : e is Exception
                ? AppException(
                    exception: e,
                    message: (e as dynamic).message,
                  )
                : AppException(
                    exception: e,
                    message: e.toString(),
                  );
  }

  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
        return "Falha de conexão, verifique sua internet";
        break;
      case DioErrorType.CANCEL:
        return "Requisição cancelada";
        break;
      case DioErrorType.RESPONSE:
      case DioErrorType.DEFAULT:
      default:
        break;
    }
    if (error.response?.statusCode != null) {
      switch (error.response.statusCode) {
        case 401:
          return "Autorização negada, verifique seu login";
          break;
        case 403:
          return "Ocorreu um erro na sua requisição, verifique os dados e tente novamente";
          break;
        case 404:
          return "Não encontrado";
          break;
        case 500:
          return "Erro interno do servidor";
          break;
        case 503:
          return "O servidor está indisponível no momento, tente novamente";
          break;
        default:
      }
    }
    if (error.message.contains("SocketException")) {
      return "Falha de conexão, verifique sua internet";
    }
    return "Erro na requisição, tente novamente";
  }
}
