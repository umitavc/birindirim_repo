import 'package:birindirm_deneme/components/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'drawer_view/drawerView.dart';
import 'body.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text("Birindirim"),
          centerTitle: true,
          actions: [
          ],
        ),
      ),
      drawer: DrawerWidget(),
      body: BodyView(),
    );
  }
}
