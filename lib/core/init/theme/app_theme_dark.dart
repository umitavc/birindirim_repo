import 'package:birindirm_deneme/core/init/theme/app_theme.dart';
import 'package:birindirm_deneme/core/init/theme/dark/theme_dark_interface.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark _instace;
  static AppThemeDark get instance {
    _instace ??= AppThemeDark._init();
    return _instace;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.black,
          toolbarTextStyle: textThemeDark.headline6,
        ),
        colorScheme: const ColorScheme.dark().copyWith(
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: Colors.black,
            onSecondary: Colors.black,
            onError: Colors.grey[600],
            
            onSurface: Colors.white),
        textTheme: textTheme(),
      );

  TextTheme textTheme() {
    return TextTheme(headline1: textThemeDark.headline1, headline6: textThemeDark.headline6);
  }
}
