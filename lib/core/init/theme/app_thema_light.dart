import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/theme_light_interface.dart';

class AppThemeLight extends AppThema with ILightTheme {
  static AppThemeLight _instace;
  static AppThemeLight get instance {
    _instace ??= AppThemeLight._init();
    return _instace;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              color: Colors.transparent,
              elevation: 0,
            ),
      );

  TextTheme textTheme() => TextTheme(
        bodyText1: const TextStyle(color: Colors.black),
        bodyText2: const TextStyle(color: Colors.black),
        headline1: textThemeLight.headline1,
        headline2: textThemeLight.headline2,
        headline3: textThemeLight.headline3,
        headline4: textThemeLight.headline4,
        headline5: textThemeLight.headline5,
        headline6: textThemeLight.headline6,
      );

  ColorScheme get appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight.orange,
      secondary: colorSchemeLight.white,
      surface: const Color(0xffffc93c),
      background: const Color(0xfff6f9fc),
      error: Colors.cyan,
      onPrimary: Colors.blue, //*
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: Colors.black12,
      onError: Colors.orange,
      brightness: Brightness.light,
    );
  }
}
