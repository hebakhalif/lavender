import 'package:dio/dio.dart';
import 'package:lavender/core/networking/api_constants.dart';
import 'package:lavender/core/networking/auth_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  // Singleton instance
  static Dio? dio;

  // Base URL
  static const String baseUrl = ApiConstants.baseUrl;

  // Initialize Dio
  static void init() {
    dio = Dio(

      BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),

    );

    // Add interceptors
    addInterceptors(dio!);
  }

  // Add interceptors
  static void addInterceptors(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = AuthHelper.access;
          if(token != null && token.isNotEmpty){
            options.headers["Auhorization"]= "Bearer $token";
          }
          return handler.next(options);     
        },
        onError: (error, handler) async=> handler.next(error),
      ),
    );

    // PrettyDioLogger
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  // GET request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  // POST request
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio!.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  // PUT request
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio!.put(
      url,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  // DELETE request
/*  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio!.delete(
      url,
      queryParameters: query,
      options: Options(headers: headers),
);
}*/
}