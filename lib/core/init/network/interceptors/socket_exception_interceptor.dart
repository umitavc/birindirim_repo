import 'dart:async';
import 'dart:io';

import 'package:birindirm_deneme/core/constant/app/string_constant.dart';
import 'package:birindirm_deneme/core/init/lang/locale_keys.g.dart';
import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as get_dialog;

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    @required this.dio,
    @required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) {
    StreamSubscription streamSubscription;

    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen((connectivtyResult) {
      if (hasConnection(connectivtyResult)) {
        streamSubscription.cancel();
        responseCompleter.complete(NetworkManager.instance.dio.fetch(requestOptions));
      }
    });

    return responseCompleter.future;
  }

  bool hasConnection(ConnectivityResult result) {
    return (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi);
  }
}

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({@required this.requestRetrier});
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    if (_shouldRetry(err)) {
      
      try {
        get_dialog.Get.defaultDialog(
        backgroundColor: get_dialog.Get.theme.colorScheme.onError,
        title: LocaleKeys.network_warning_title.locale,
        titleStyle: get_dialog.Get.theme.textTheme.headline6.copyWith(fontSize: 16, color: get_dialog.Get.theme.colorScheme.onSurface, fontWeight: FontWeight.bold),
        middleText: LocaleKeys.network_warning_description.locale,
        middleTextStyle: get_dialog.Get.textTheme.headline6.copyWith(fontSize: 16, color: get_dialog.Get.theme.colorScheme.onSurface),
        barrierDismissible: false,
      );
        //Retry request ///eger hata sonlanmıs ise ve tekrar istek atılıyorsa bu getxi kapatma vakti 
        requestRetrier.scheduleRequestRetry(err.requestOptions).then((value) {
          get_dialog.Get.close(1);
          handler.next(err);
        });
      } catch (e) {
        debugPrint(e);
      }
    }
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other && err.error != null && err.error is SocketException;
  }

  asd() {
    //theMovieImdb
    NetworkManager.instance.dio.post("/getMovies");
    NetworkManager.instance.dio.post("/getSeries");
    NetworkManager.instance.dio.post("/getPopularSeries");

    //401
    //Api key?
  }
}
