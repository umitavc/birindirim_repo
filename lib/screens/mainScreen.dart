import 'package:flutter/material.dart';

import 'body.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const  Size.fromHeight(100.0),
        child: AppBar(
            backgroundColor: Colors.amber.shade700,
            title: const Text(
              "Birindirim",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu, color: Colors.white))),
      ),
      body: const BodyView(),
    );
  }
}
