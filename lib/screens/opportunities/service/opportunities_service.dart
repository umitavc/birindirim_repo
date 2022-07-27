// ignore_for_file: missing_return

import 'dart:convert';

import 'package:birindirm_deneme/core/constant/services/end_point.dart';
import 'package:birindirm_deneme/core/init/network_manager.dart';

class OpportunitiesService {
  final dio = NetworkManager.instance.dio;

  Future<List<dynamic>> fetchAllOpportinies() async {
    final response = await dio.get(EndPointsConstants.OPPORTUNITIES_PATH);
    try {
      if (response.statusCode == 200) {
        final Iterable jsonList = response.data is String ? jsonDecode(response.data) : response.data;
        if (jsonList is List) {
          return jsonList;
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print("hata *********** :$e");
    }
  }
}
