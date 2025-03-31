import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_mvvm_template/config/app_consts.dart';

class ApiClientService {
  static ApiClientService? _instance;

  late final Dio _dio;
  static final Duration _timeout = Duration(seconds: 30);

  factory ApiClientService() {
    return _instance ??= ApiClientService._();
  }

  ApiClientService._() {
    final BaseOptions options = BaseOptions(
      baseUrl: AppConsts.apiBaseUrl,
      connectTimeout: _timeout,
    );

    _dio = Dio(options);

    _dio.interceptors.addAll([RetryInterceptor(dio: _dio, retries: 3)]);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.post(path, queryParameters: queryParameters, data: data);
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.put(path, queryParameters: queryParameters, data: data);
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.delete(
      path,
      queryParameters: queryParameters,
      data: data,
    );
  }
}
