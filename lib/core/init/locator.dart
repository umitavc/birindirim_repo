import 'package:birindirm_deneme/screens/coupons/view_model/coupons_view_model.dart';
import 'package:birindirm_deneme/screens/opportunities/view_model/opportunities_view_model.dart';
import 'package:get_it/get_it.dart';

import '../../screens/brands_view/viewmodel/brands_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CouponsViewModel());
  locator.registerLazySingleton(() => OpportunitiesViewModel());
}
