import 'package:birindirm_deneme/core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';


const kTextColor =Color (0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kButtonColor =Color(0xFFF8FAF8);
const kIconsColors =Color(0x42000000);
const kTitleColor =Color(0xFFFFFFFF);
const kTitleLightColor =Color(0xFFE2E4E2);
const kAppBarColor =Color(0xFF3DA63D);
const kModalBottomColor=Color(0xFF0987E2);




const kDefaultPaddin = 4.0;



class LocaleConstants {
   static const supported_locale = [
    LocaleConstants.trLocale,
    LocaleConstants.enLocale
  ];
  static const trLocale = Locale("tr","TR");
  static const enLocale = Locale("en","US");
  static const localePath = "assets/language";




  
}


