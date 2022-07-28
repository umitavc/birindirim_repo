import 'dart:convert';

import 'package:birindirm_deneme/components/local_get_snackbar.dart';
import 'package:birindirm_deneme/core/constant/enum/service_enum.dart';
import 'package:birindirm_deneme/core/constant/services/end_point.dart';
import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/screens/coupons/model/coupons_model.dart';
import 'package:get/get.dart';

class CouponsService {
  final dio = NetworkManager.instance.dio;

  Future<List<CouponsModel>> fetchAllOpportinies() async {
    final response = await dio.get(EndPointsConstants.COUPONS_LIST_PATH);
    try {
      if (response.statusCode == 200) {
        final Iterable jsonList = response.data is String ? jsonDecode(response.data) : response.data;
        //print("data oncesi" + jsonList.toString());
        if (jsonList is List) {
          List<CouponsModel> couponList = List<CouponsModel>.from(jsonList.map((coupon) => CouponsModel.fromJson(coupon)));
          return couponList;
        }

        //print("data"+data.toString());

      }
    } catch (e) {
      LocaleGetSnackBar.localeSnackBar(true, "lütfen daha sonra tekrar deneyiniz");
    }
  }
}
