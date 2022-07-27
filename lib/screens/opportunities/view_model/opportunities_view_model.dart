
import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/screens/opportunities/service/opportunities_service.dart';
import 'package:flutter/cupertino.dart';
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
  }

  Future<void> goToLink(String link) async {
    var encoded = Uri.encodeFull(link);
    print("link" + encoded);

    /*  if (await canLaunch(encoded)) {
      await launch(encoded);
    } else {
      throw "Could not launch $encoded";
    } */
  }
}
