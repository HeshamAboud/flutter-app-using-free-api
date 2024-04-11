import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Diohelper {
  static Dio dio = Dio();

  static Future<void> init() async {
    dio = await Dio(
      BaseOptions(
        baseUrl: 'http://172.16.1.176:56487/api/prod/',
        receiveDataWhenStatusError: true,
      ),
    );

    dio
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 5);
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    dynamic query,
  }) async {
    return await dio.get(url, data: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
// static Future<Response> putData({
//   @required String url,
//   Map<String, dynamic> query,
//   @required Map<String, dynamic> data,
//   String lang = 'en',
//   String token,
// }
//     ) async {
//   dio.options.headers={
//     'Content-Type': 'application/json',
//     'lang':lang??'ar',
//     'Authorization': token??'',
//   };
//   return dio.put(url,data: data,queryParameters: query,);
// }
}
