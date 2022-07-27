

import 'color_scheme_light.dart';
import 'text_theme_light.dart';

abstract class ILightTheme{
  TextThemeLight get textThemeLight=>TextThemeLight.instance;
  ColorSchemeLight get colorSchemeLight=>ColorSchemeLight.instance;
} 