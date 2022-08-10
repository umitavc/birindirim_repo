

import 'package:birindirm_deneme/screens/coupons/view_model/coupons_view_model.dart';
import 'package:birindirm_deneme/screens/opportunities/view_model/opportunities_view_model.dart';
import 'package:birindirm_deneme/screens/splash_view/view/splash_view.dart';
import 'package:birindirm_deneme/screens/splash_view/view_model/splash_view_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'components/constant.dart';
import 'components/network_widget_page.dart';
import 'core/init/cache/connectivity_manager.dart';
import 'core/init/lang/locale_keys.g.dart';
import 'core/init/locator.dart';
import 'core/init/network/interceptors/api_key_challange_interceptor.dart';
import 'core/init/network/interceptors/socket_exception_interceptor.dart';
import 'core/init/network_manager.dart';
import 'core/init/notifier/theme_notifier.dart';

Future<void> main() async {
  await _init();
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => locator<OpportunitiesViewModel>()),
    ChangeNotifierProvider(create: (context) => locator<CouponsViewModel>()),
    ChangeNotifierProvider(create: (context) => locator<SplashViewModel>()),
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
  ], child: EasyLocalization(child: MyApp(), 
   supportedLocales:LocaleConstants.supported_locale,
  //LocaleConstants.trLocale,
  startLocale: LocaleConstants.trLocale,
  saveLocale: true,
  fallbackLocale: LocaleConstants.enLocale,
  
  path: LocaleConstants.localePath)
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("theme");
  NetworkManager.instance.addInterceptor(RetryOnConnectionChangeInterceptor(
    requestRetrier: DioConnectivityRequestRetrier(
      connectivity: Connectivity(),
      dio: NetworkManager.instance.dio,
    ),
  ));
  NetworkManager.instance.addInterceptor(ApiKeyChallangeSolutionInterceptor());
  NetworkManager.instance.addInterceptor(ApiKeyChallangeInterceptor());
}
//task_b
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      //onReady: () => ConnectivityManager.instance,
      builder: (context, widget) {
        return Column(
          children: [
            Expanded(child: widget ?? const SizedBox()),
            const NetworkWidgetPage(),
          ],
        );
      },
      home: const SplashView(),
    );
  }
}
