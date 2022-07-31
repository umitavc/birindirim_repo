import 'package:birindirm_deneme/core/init/theme/dark/color_sheme_dark.dart';
import 'package:birindirm_deneme/core/init/theme/dark/text_theme_dark.dart';

abstract class IDarkTheme{
  TextThemeDark get  textThemeDark=>TextThemeDark.instance;
  ColorSchemeDark get colorSchemeDark=>ColorSchemeDark.instance;
}