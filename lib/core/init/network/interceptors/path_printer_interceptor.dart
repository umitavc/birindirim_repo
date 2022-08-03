import 'package:birindirm_deneme/core/init/network/interceptors/socket_exception_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PathPrinterInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;
  PathPrinterInterceptor({@required this.requestRetrier});
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path != null) {
      print("path değeri : " + options.path);
      handler.next(options);
    }
  }
}
