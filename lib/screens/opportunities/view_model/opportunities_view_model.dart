// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:math';

import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/screens/opportunities/service/opportunities_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/opportunities_model.dart';

class OpportunitiesViewModel extends ChangeNotifier {
  final dio = NetworkManager.instance.dio;

  List<OpportunitiesModel> listItem = [];
  List<dynamic> modelList = [];
  OpportunitiesService _service;
  int sayi = 5;
  bool isLoading = false;
  void changeIsloading() {
    isLoading = !isLoading;
  }

  void fetcAllOpportunities() async {
    
    _service = OpportunitiesService();
    changeIsloading();
    final list = await _service.fetchAllOpportinies();
    modelList = list;
    changeIsloading();
    notifyListeners();
    print(" view modela girdi");
    
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
}
