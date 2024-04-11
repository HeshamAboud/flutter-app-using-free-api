import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../helper/cache_helper.dart';

class AppInterceptor extends Interceptor {
  final Dio dio;

  AppInterceptor({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    // options.headers[]
    //
    print("onRequest method");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      CacheHelper.removeData(key: 'login').then((value) {
        CacheHelper.removeData(key: 'accessToken').then((value) {
          CacheHelper.removeData(key: 'unit').then((value) {
          });
        });
      });

      // CacheHelper.removeData(key: 'login')
      //     .then((value) => CacheHelper.removeData(key: 'accessToken'))
      //     .then((value) {
      //   // Navigator.pushNamedAndRemoveUntil(
      //   //     context, splashScreen, (route) => false);
      // });
    }

    super.onError(err, handler);
  }
}
