import 'package:birindirm_deneme/core/init/cache/connectivity_manager.dart';
import 'package:birindirm_deneme/screens/mainScreen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewModel extends ChangeNotifier {
  bool loading = true;

  void init(BuildContext context) async {
    await ConnectivityManager.instance.getInitialStatus();

    ConnectivityManager.instance.connectivity.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        Future.delayed(const Duration(seconds: 3)).then((value) => Get.to(const MainScreens()));
      }
    });
  }
}
