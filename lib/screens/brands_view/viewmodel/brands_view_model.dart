import 'dart:convert';

import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/core/utils/enums/fetch_status_enum.dart';
import 'package:birindirm_deneme/screens/brands_view/model/brands_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BrandsViewModel extends ChangeNotifier {
  List<BrandsModel> modelList;
  FetchStatus status = FetchStatus.loading;

  fetchBrandsProducts() async {
    status = FetchStatus.loading;
    notifyListeners();
    try {
      Response response = await NetworkManager.instance.dio.get("/aktuel/?page=brand-list");
      if (response.statusCode == 200) {
        status = FetchStatus.success;
        notifyListeners();
        final Iterable json = response.data is String ? jsonDecode(response.data) : response.data;
        modelList = List<BrandsModel>.from(json.map((e) => BrandsModel.fromJson(e)));
      } else {
        status = FetchStatus.error;
        notifyListeners();
      }
    } catch (e) {
      status = FetchStatus.error;
      notifyListeners();
    }
    notifyListeners();
  }
}
