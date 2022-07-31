// ignore_for_file: avoid_print, deprecated_member_use

import 'package:birindirm_deneme/screens/coupons/model/coupons_model.dart';
import 'package:birindirm_deneme/screens/coupons/service/coupons_services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CouponsViewModel extends ChangeNotifier {
  List<CouponsModel> _couponList;
  List<CouponsModel> get couponList => _couponList;
  CouponsService _service;
  bool isLoading = false;
  bool isRefresh = false;
  bool connectionWaiting = false;

  void changeIsloading() {
    isLoading = !isLoading;
  }

  void changeConnectionWaiting(bool state) {
    connectionWaiting = state;
  }

  Future<void> refreshIndicator() async {
    _service = CouponsService();
    changeIsloading();
    final list = await _service.fetchAllOpportinies();
    _couponList = list;
    await Future.delayed(const Duration(milliseconds: 2000));
    changeIsloading();
    notifyListeners();
  }

  Future<void> fetcAllCoupoins() async {
    final connection = await connectionControl();
    if (connection) return;
    if (_couponList?.isNotEmpty ?? false) return;

    _service = CouponsService();

    changeIsloading();
    final list = await _service.fetchAllOpportinies();
    _couponList = list;
    changeIsloading();

    // print("data saısı" + modelList.length.toString());
    notifyListeners();
  }

  Future<void> goToLink(String link) async {
    try {
      var encoded = Uri.encodeFull(link);
      if (await canLaunch(encoded)) {
        await launch(encoded);
      }
    } catch (e) {
      print("hata $e");
    }
  }

  Future<bool> connectionControl() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      changeConnectionWaiting(true);
      notifyListeners();
      return true;
    } else {
      changeConnectionWaiting(false);
      notifyListeners();
      return false;
    }
  }
}
