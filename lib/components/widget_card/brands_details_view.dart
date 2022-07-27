import 'package:flutter/material.dart';

class BrandsDetailScreens extends StatefulWidget {
  final String topic;
  const BrandsDetailScreens({Key key, this.topic,  }) : super(key: key);

  @override
  State<BrandsDetailScreens> createState() => _BrandsDetailScreensState();
}

class _BrandsDetailScreensState extends State<BrandsDetailScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("topic"),
      ),
    );
  }
}