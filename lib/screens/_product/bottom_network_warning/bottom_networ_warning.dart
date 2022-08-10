import 'package:birindirm_deneme/components/network_widget_page.dart';
import 'package:flutter/cupertino.dart';

class MainBuilder {
  MainBuilder._(); //baska bir sınıftan  turetilmesin singleton gibi
  static Widget build(BuildContext context, Widget widget) {
    return Column(
      children: [
        Expanded(child: widget ?? const SizedBox()),
        const NetworkWidgetPage(),
      ],
    );
  }
}
