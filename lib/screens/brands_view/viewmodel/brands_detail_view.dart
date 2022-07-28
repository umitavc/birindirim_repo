import 'dart:convert';

import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/core/utils/enums/fetch_status_enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../model/brandsDetails_model.dart';

class BrandsDetailsViewModel extends ChangeNotifier {
  List<BrandsDetailsModel> modelList;
  FetchStatus status = FetchStatus.loading;

  fetchBrandsDetailsProducts() async {
    status = FetchStatus.loading;
    notifyListeners();
    try {
      Response response = await NetworkManager.instance.dio.get("/aktuel/?page=brand&brand=bim-com-tr");
      if (response.statusCode == 200) {
        status = FetchStatus.success;
        notifyListeners();
        final Iterable json = response.data is String ? jsonDecode(response.data) : response.data;
        modelList = List<BrandsDetailsModel>.from(json.map((e) => BrandsDetailsModel.fromJson(e)));
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