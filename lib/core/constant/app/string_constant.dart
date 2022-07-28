import 'package:birindirm_deneme/core/init/network_manager.dart';

class StringConstant {
  static StringConstant _instace;
  static StringConstant get instance {
    _instace ??= StringConstant._init();
    return _instace;
  }

  StringConstant._init();
}

extension StringExtension on String {
  // ignore: unnecessary_string_interpolations
  String get launchToString => "${NetworkManager.instance.dio.options.baseUrl.toString()+this}";
}
