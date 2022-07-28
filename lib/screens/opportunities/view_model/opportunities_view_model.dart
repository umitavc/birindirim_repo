// ignore_for_file: deprecated_member_use, avoid_print

import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/screens/opportunities/model/opportunities_model.dart';
import 'package:birindirm_deneme/screens/opportunities/service/opportunities_service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpportunitiesViewModel extends ChangeNotifier {
  final dio = NetworkManager.instance.dio;
  List<OpportunitiesModel> _opportunitiesList;
  List<OpportunitiesModel> get opportunitiesList => _opportunitiesList;
  OpportunitiesService _service;
  int sayi = 5;
  bool isLoading = false;
  bool connectionWaiting = false;
  void changeIsloading() {
    isLoading = !isLoading;
  }

  void changeConnectionWaiting(bool state) {
    connectionWaiting = state;
  }

  Future<void> fetcAllOpportunities() async {
    final connection = await connectionControl();
    if (connection) return;
    if (_opportunitiesList?.isNotEmpty ?? false) return;
    _service = OpportunitiesService();
    changeIsloading();
    final list = await _service.fetchAllOpportinies();
    _opportunitiesList = list;
    changeIsloading();
    notifyListeners();
  }

  Future<void> goToLink(String link) async {
    try {
      var encoded = Uri.encodeFull(link);
      if (await canLaunch(encoded)) {
        print("encoded  :" + encoded);
        await launch(encoded);
      }
    } catch (e) {
      print("hata $e");
    }

    /*  if (await canLaunch(encoded)) {
      await launch(encoded);
    } else {
      throw "Could not launch $encoded";
    } */
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
