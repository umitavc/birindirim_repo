import 'package:birindirm_deneme/core/constant/enum/app_theme_enum.dart';
import 'package:birindirm_deneme/core/init/cache/local_manager.dart';
import 'package:birindirm_deneme/core/init/theme/app_thema_light.dart';
import 'package:birindirm_deneme/core/init/theme/app_theme_dark.dart';
import 'package:flutter/material.dart';

final themeMode = Boxes.getDark();

class ThemeNotifier extends ChangeNotifier {
  ThemeData get currentTheme => _localTheme;
  ThemeData _localTheme = themeMode.get("darkMode", defaultValue: false) ? AppThemeDark.instance.theme : AppThemeLight.instance.theme;

  AppThemeEnum get appThemes => _appTheme;
  AppThemeEnum _appTheme = themeMode.get("darkMode", defaultValue: false) ? AppThemeEnum.dark : AppThemeEnum.light;

  void changeTheme(AppThemeEnum appThemeEnum) {
    if (appThemeEnum == AppThemeEnum.dark) {
      _localTheme = AppThemeDark.instance.theme;
      _appTheme = AppThemeEnum.dark;
    } else {
      _localTheme = AppThemeLight.instance.theme;
      _appTheme = AppThemeEnum.light;
    }
    notifyListeners();
  }
}
