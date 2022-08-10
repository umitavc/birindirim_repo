import 'package:birindirm_deneme/core/constant/app/application_constant.dart';
import 'package:birindirm_deneme/core/init/cache/connectivity_manager.dart';
import 'package:birindirm_deneme/core/init/lang/language_manager.dart';
import 'package:birindirm_deneme/core/init/locator.dart';
import 'package:birindirm_deneme/core/init/network/interceptors/socket_exception_interceptor.dart';
import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/core/init/notifier/theme_notifier.dart';
import 'package:birindirm_deneme/screens/_product/bottom_network_warning/bottom_networ_warning.dart';
import 'package:birindirm_deneme/screens/coupons/view_model/coupons_view_model.dart';
import 'package:birindirm_deneme/screens/opportunities/view_model/opportunities_view_model.dart';
import 'package:birindirm_deneme/screens/splash_view/view/splash_view.dart';
import 'package:birindirm_deneme/screens/splash_view/view_model/splash_view_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'core/init/network/interceptors/api_key_challange_interceptor.dart';

void main() async {
  await _init();
  setupLocator();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => locator<OpportunitiesViewModel>()),
        ChangeNotifierProvider(create: (context) => locator<CouponsViewModel>()),
        ChangeNotifierProvider(create: (context) => locator<SplashViewModel>()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ],
      child: EasyLocalization(
          supportedLocales: LanguageManager.instance.supportLocale,
          path: ApplicationConstant.LANG_ASSET_PATH,
          startLocale: LanguageManager.instance.trLocale,
          child: const MyApp())));
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.watch<ThemeNotifier>().currentTheme,
      onReady: () => ConnectivityManager.instance,
      builder: MainBuilder.build,
      home: const SplashView(),
    );
  }
}
