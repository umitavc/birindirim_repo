import 'dart:async';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityManager {
  static final ConnectivityManager _instance = ConnectivityManager._init();
  static ConnectivityManager get instance => _instance;
  Connectivity _connectivity;
  ConnectivityResult _connectionStatus;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool _showError = false;

  ConnectivityManager._init() {
    _connectionStatus = ConnectivityResult.none;
    _connectivity = Connectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _updateConnectionStatus(_connectionStatus);
    getInitialStatus();
  }

  Future<void> getInitialStatus() async {
    try {
      await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Could not check connectivity status', error: e);
      return;
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    log("Connection Status: ${_connectionStatus.name}");
    if (_connectionStatus == ConnectivityResult.none) {
      showError();
    } else {
      closeError();
    }
  }

  void showError() {
    if (Get.isDialogOpen) Get.close(1);
    if (!_showError) {
      Get.defaultDialog(
        backgroundColor: Get.theme.colorScheme.onError,
        title: 'Hay aksi !',
        titleStyle: Get.theme.textTheme.headline6.copyWith(fontSize: 16, color: Get.theme.colorScheme.onSurface, fontWeight: FontWeight.bold),
        middleText: 'lütfen internet  baglantınızı kontrol ediniz',
        middleTextStyle: Get.textTheme.headline6.copyWith(fontSize: 16, color: Get.theme.colorScheme.onSurface),
        barrierDismissible: false,
      );
      _showError = true;
      log("ConnectivityService: Error showed.");
    }
  }

  void closeError() {
    if (_showError && Get.isDialogOpen) {
      Get.close(1);
      _showError = false;
      log("ConnectivityService: Error closed.");
    }
  }

  cancel() {
    _connectivitySubscription.cancel();
  }
}
