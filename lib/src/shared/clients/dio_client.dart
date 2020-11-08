import 'package:dio/dio.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart' as snowBase;
import 'package:nasa_photos/src/shared/constants/constants.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.connectTimeout = 10000;
    _dio.options.sendTimeout = 10000;
    _dio.options.receiveTimeout = 10000;

    _dio.interceptors.add(snowBase.LogInterceptor());
    _dio.interceptors.add(snowBase.CacheInterceptor());
    _dio.options.baseUrl = flavor.baseUrl;
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
