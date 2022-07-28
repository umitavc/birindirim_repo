import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleGetSnackBar {
  static SnackbarController localeSnackBar(bool isThereMistake, String message) {
    return Get.snackbar("Uyarı", message,
        colorText: Colors.white, backgroundColor: isThereMistake ? Colors.red : Colors.blue, icon: Icon(isThereMistake ? Icons.cancel : Icons.check));
  }
}
