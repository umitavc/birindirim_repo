import 'package:birindirm_deneme/screens/coupons/model/coupons_model.dart';
import 'package:birindirm_deneme/screens/coupons/service/coupons_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class CouponsViewModel extends ChangeNotifier {
  List<CouponsModel> _couponList;
  List<CouponsModel> get couponList => _couponList;
  CouponsService _service;
  bool isLoading = false;
  void changeIsloading() {
    isLoading = !isLoading;
  }

  void fetcAllCoupoins() async {
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
    var encoded = Uri.encodeFull(link);
    print("link" + encoded);

    if (await canLaunch(encoded)) {
      await launch(encoded);
    } else {
      throw "Could not launch $encoded";
    }
  }
}
