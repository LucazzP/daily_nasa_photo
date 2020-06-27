import 'package:dio/dio.dart';

import 'package:projectbasesnow/dio/interceptors/log_interceptor.dart' as log;
import 'package:nasa_photos/src/shared/constants/constants.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.connectTimeout = 10000;
    _dio.options.sendTimeout = 10000;
    _dio.options.receiveTimeout = 10000;

    _dio.interceptors.add(log.LogInterceptor());
    _dio.options.baseUrl = flavor.baseUrl;

    _dio.options.headers.addAll({
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNTkwNzc1NjQ2LCJleHAiOjE1OTMzNjc2NDZ9.CP_xj_cdDlLtw0YuWbD-fKvvn-HDN52rAYmNu3j2CC4"
    });
  }

  Future<T> delete<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
  }) async {
    final res = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onReceiveProgress,
  }) async {
    final res = await _dio.get<T>(
      path,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T> patch<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    final res = await _dio.patch<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    final res = await _dio.post<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T> put<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> headers,
    Map<String, dynamic> extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    final res = await _dio.put<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }
}
