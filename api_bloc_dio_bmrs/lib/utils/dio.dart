import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MyDio {

  static final _optionsServer = BaseOptions(
    // baseUrl: 'https://webzbinaryz.web.app/',
    baseUrl: 'https://webzbinaryz.web.app/',
    connectTimeout: 15000,
    receiveTimeout: 15000,
  );

  static Dio createDioServer() {
    Dio dio = Dio(_optionsServer);
    dio.interceptors.add(MyInterceptors());
    return dio;
  }
}

class MyInterceptors extends Interceptor {
  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler)  {
    String token =  "";
    // String token = "";

    if (kDebugMode) {
      print(" token : $token");
    }
    String refToken = "";
    if (kDebugMode) {
      print(" refToken : $refToken");
    }
    options.headers["Authorization"] = "Bearer $token";

    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }
}
