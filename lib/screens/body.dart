import 'package:birindirm_deneme/core/constant/enum/app_theme_enum.dart';
import 'package:birindirm_deneme/core/init/cache/local_manager.dart';
import 'package:birindirm_deneme/core/init/lang/locale_keys.g.dart';
import 'package:birindirm_deneme/core/init/notifier/theme_notifier.dart';
import 'package:birindirm_deneme/screens/coupons/view/coupons_view.dart';
import 'package:birindirm_deneme/screens/opportunities/view/opportunities_view.dart';
import 'package:birindirm_deneme/screens/populer_view/view/populer_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../core/init/lang/locale_keys.g.dart';
import 'brands_view/view/brands_view.dart';
import 'package:birindirm_deneme/core/constant/app/string_constant.dart';

class BodyView extends StatefulWidget {
  const BodyView({Key key}) : super(key: key);

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  int _currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pageItems = [
      //ümit
      const PopularView(),
      const BrandsView(),

      //kerem
      const OpportunitiesView(),

      const CouponsView()
    ];
    return Scaffold(
      body: PageView.builder(
          itemCount: pageItems.length,
          onPageChanged: (index) {
            setState(() {
              _currenIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return pageItems[_currenIndex];
          }),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ValueListenableBuilder<Box>(
            valueListenable: Boxes.getDark().listenable(),
            builder: (context, box, child) {
              return FloatingActionButton(
                onPressed: () {
                  if (box.get("darkMode") != null && box.get("darkMode")) {
                    box.put("darkMode", false);
                    context.read<ThemeNotifier>().changeTheme(AppThemeEnum.light);
                  } else {
                    box.put("darkMode", true);
                    context.read<ThemeNotifier>().changeTheme(AppThemeEnum.dark);
                  }
                },
                child: const Icon(Icons.dark_mode_rounded),
                backgroundColor: context.watch<ThemeNotifier>().appThemes == AppThemeEnum.dark ? Colors.white : Colors.orange,
              );
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: context.watch<ThemeNotifier>().appThemes == AppThemeEnum.dark ? Colors.black : Colors.orange,
            icon: Text(
              LocaleKeys.home_popular.locale,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(backgroundColor: context.watch<ThemeNotifier>().appThemes == AppThemeEnum.dark ? Colors.black : Colors.orange, icon: Text(LocaleKeys.home_brands.locale, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)), label: ""),
          BottomNavigationBarItem(backgroundColor: context.watch<ThemeNotifier>().appThemes == AppThemeEnum.dark ? Colors.black : Colors.orange, icon: Text(LocaleKeys.home_opportunities.locale, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)), label: ""),
          BottomNavigationBarItem(
            backgroundColor: context.watch<ThemeNotifier>().appThemes == AppThemeEnum.dark ? Colors.black : Colors.orange,
            icon: Text(LocaleKeys.home_coupons.locale, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)),
            label: "",
          ),
        ],
        currentIndex: _currenIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _currenIndex = index;
          });
        },
      ),
    );
  }

  Widget buildTabItem({
    int index,
    Widget baslik, // Icon icon olunca sadece icon türünde değişken verebiliyorsun ama widget  ile her türde değiişken verirsin
  }) {
    return IconButton(
      onPressed: () {},
      icon: baslik,
      iconSize: 56,
    );
  }
}
