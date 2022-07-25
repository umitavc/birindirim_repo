import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight _instace;
  static ColorSchemeLight get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();
  final Color orange = const Color.fromRGBO(255, 143, 18, 1);
  final Color white = const Color(0xffffffff);
}
