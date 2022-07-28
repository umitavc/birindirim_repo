import 'package:birindirm_deneme/components/network_widget_page.dart';
import 'package:birindirm_deneme/core/init/locator.dart';
import 'package:birindirm_deneme/core/init/theme/app_thema_light.dart';
import 'package:birindirm_deneme/screens/coupons/view_model/coupons_view_model.dart';
import 'package:birindirm_deneme/screens/mainScreen.dart';
import 'package:birindirm_deneme/screens/opportunities/view_model/opportunities_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => locator<OpportunitiesViewModel>()),
    ChangeNotifierProvider(create: (context) => locator<CouponsViewModel>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppThemeLight.instance.theme,
        home: const MainScreens(),
        builder: (context, widget) {
          return Column(
            children: [
              Expanded(child: widget ?? const SizedBox()),
              const NetworkWidgetPage(),
            ],
          );
        }
        );
  }
}
