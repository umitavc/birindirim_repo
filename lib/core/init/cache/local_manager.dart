import 'package:hive/hive.dart';

class Boxes{
  static  Box getDark()=>Hive.box("theme");
}