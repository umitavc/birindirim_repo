import 'package:birindirm_deneme/screens/coupons/view_model/coupons_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CouponsViewModel());
}
