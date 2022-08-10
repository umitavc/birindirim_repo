import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:easy_localization/easy_localization.dart';

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
  String get locale=>this.tr();
}
