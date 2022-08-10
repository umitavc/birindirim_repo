import 'package:flutter/cupertino.dart';

class LanguageManager {
  static LanguageManager _instace;
  static LanguageManager get instance {
    _instace ??= LanguageManager._init();
    return _instace;
  }
  final enLocale= const Locale("en","US");
  final trLocale=const Locale("tr","TR");

  List<Locale> get supportLocale=>[trLocale,enLocale];

  LanguageManager._init();
}
