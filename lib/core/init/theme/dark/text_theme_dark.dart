import 'package:flutter/material.dart';

class TextThemeDark {
  static TextThemeDark _instace;
  static TextThemeDark get instance {
    _instace ??= TextThemeDark._init();
    return _instace;
  }

  TextThemeDark._init();
  final TextStyle headline1 = const TextStyle(fontSize: 95, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: Colors.black);
  final TextStyle headline2 = const TextStyle(fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: Colors.black);
  final TextStyle headline3 = const TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black);
  final TextStyle headline4 = const TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.black);
  final TextStyle headline5 = const TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black);
  final TextStyle headline6 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: Colors.white);
}
