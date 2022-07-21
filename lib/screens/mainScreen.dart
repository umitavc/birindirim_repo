import 'package:flutter/material.dart';

import '../components/body.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(backgroundColor: Colors.amber.shade700, title: Text("Birindirim"), centerTitle: true, leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
      ),
      body: BodyView(),
    );
  }
}
