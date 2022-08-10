import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/theme_light_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instace;
  static AppThemeLight get instance {
    _instace ??= AppThemeLight._init();
    return _instace;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.orange,
          onPrimary: Colors.orange,
          secondary: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onError: Colors.black),
      textTheme: textTheme(),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.amber.shade700,
        toolbarTextStyle: textThemeLight.headline6,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      canvasColor: Colors.amber.shade700);

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
}
