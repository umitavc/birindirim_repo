import 'package:birindirm_deneme/core/constant/app/string_constant.dart';
import 'package:birindirm_deneme/core/constant/enum/app_theme_enum.dart';
import 'package:birindirm_deneme/core/init/cache/local_manager.dart';
import 'package:birindirm_deneme/core/init/lang/language_manager.dart';
import 'package:birindirm_deneme/core/init/lang/locale_keys.g.dart';
import 'package:birindirm_deneme/core/init/notifier/theme_notifier.dart';
import 'package:birindirm_deneme/screens/drawer_view/iconPage/hakkimizda.dart';
import 'package:birindirm_deneme/screens/mainScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);
  //final urlImage = "https://fidansepetim.com/uploads/p/p/3-Yas-Asili-Granny-Smith-Elma-Fidani-Yesil-Mayhos_1.jpg";
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: Material(
        color: context.watch<ThemeNotifier>().appThemes == AppThemeEnum.dark ? Colors.black : Colors.amber.shade700,
        child: ListView(
          padding: padding,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(64),
                        child: Image.asset(
                          "assets/images/elma.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            builMenuItem(
              text: LocaleKeys.drawer_home.locale,
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(
              height: 16,
            ),
            builMenuItem(
              text: LocaleKeys.drawer_about.locale,
              icon: Icons.wrap_text,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(
              height: 16,
            ),
            builMenuItem(
              text:LocaleKeys.drawer_rate.locale,
              icon: Icons.thumb_up,
            ),
            SizedBox(
              height: 16,
            ),
            builMenuItem(
              text: LocaleKeys.drawer_share.locale,
              icon: Icons.share,
            ),
           DropdownButton<dynamic>(
                  value: context.watch<ThemeNotifier>().locale,
                  items: [
                    DropdownMenuItem(
                      value: LanguageManager.instance.trLocale,
                      child: const Text("TR"),
                    ),
                    DropdownMenuItem(value: LanguageManager.instance.enLocale, child: const Text("EN")),
                  ],
                  onChanged: (value) {
                    context.read<ThemeNotifier>().changeLanguage(value);
                    context.setLocale(value);
                    Get.updateLocale(value);
                    // box.put("lang", value);
                  },
                )
          ],
        ),
      ),
    );
  }

  Widget builMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreens()));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HakkimizdaView()));
        break;
    }
  }
}
