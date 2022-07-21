import 'package:dio/dio.dart';

class NetworkManager {
  Dio dio;

  static NetworkManager _instance;
  static NetworkManager get instance {
    return _instance ??= NetworkManager._init();
  }

  NetworkManager._init() {
    dio = Dio();
    dio.options.sendTimeout = 40000;
    dio.options.baseUrl = "https://api.yazilimgo.com";
  }
}
