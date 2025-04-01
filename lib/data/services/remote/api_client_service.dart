import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mvvm_template/config/app_consts.dart';

class ApiClientService {
  static ApiClientService? _instance;

  late final Dio _dio;
  static final String _apiKey = dotenv.env[AppConsts.kApiKeyName]!;
  static final Duration _timeout = Duration(seconds: 30);

  factory ApiClientService() {
    return _instance ??= ApiClientService._();
  }

  ApiClientService._() {
    final BaseOptions options = BaseOptions(
      baseUrl: AppConsts.kApiBaseUrl,
      connectTimeout: _timeout,
    );

    _dio = Dio(options);

    _dio.interceptors.addAll([
      RetryInterceptor(dio: _dio, retries: AppConsts.kApiRetryCount),
    ]);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    _setHeaders();
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    _setHeaders();
    return await _dio.post(path, queryParameters: queryParameters, data: data);
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    _setHeaders();
    return await _dio.put(path, queryParameters: queryParameters, data: data);
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    _setHeaders();
    return await _dio.delete(
      path,
      queryParameters: queryParameters,
      data: data,
    );
  }

  void _setHeaders() {
    if (_apiKey.isEmpty) {
      throw Exception('API_KEY is not set, check your .env file');
    }
    final Map<String, dynamic> headers = {'X-Auth-Token': _apiKey};
    _dio.options.headers.addAll(headers);
  }
}
