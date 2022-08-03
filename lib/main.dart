import 'package:birindirm_deneme/components/network_widget_page.dart';
import 'package:birindirm_deneme/core/init/locator.dart';
import 'package:birindirm_deneme/core/init/network/interceptors/path_printer_interceptor.dart';
import 'package:birindirm_deneme/core/init/network/interceptors/socket_exception_interceptor.dart';
import 'package:birindirm_deneme/core/init/network_manager.dart';
import 'package:birindirm_deneme/core/init/notifier/theme_notifier.dart';
import 'package:birindirm_deneme/screens/coupons/view_model/coupons_view_model.dart';
import 'package:birindirm_deneme/screens/mainScreen.dart';
import 'package:birindirm_deneme/screens/opportunities/view_model/opportunities_view_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await _init();
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => locator<OpportunitiesViewModel>()),
    ChangeNotifierProvider(create: (context) => locator<CouponsViewModel>()),
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
  ], child: const MyApp()));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("theme");
  NetworkManager.instance.addInterceptor(RetryOnConnectionChangeInterceptor(
    
    requestRetrier: DioConnectivityRequestRetrier(
      connectivity: Connectivity(),
      dio: NetworkManager.instance.dio,
    ),
  ));
  NetworkManager.instance.addInterceptor(PathPrinterInterceptor(
    
    requestRetrier: DioConnectivityRequestRetrier(
      connectivity: Connectivity(),
      dio: NetworkManager.instance.dio,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      builder: (context, widget) {
        return Column(
          children: [
            Expanded(child: widget ?? const SizedBox()),
            const NetworkWidgetPage(),
          ],
        );
      },
      home: const MainScreens(),
    );
  }
}
