import 'package:birindirm_deneme/public/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HakkimizdaView extends StatelessWidget {
  const HakkimizdaView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hakkımızda'),
        ),
        body: Container(
          child: Text("buraya hakkımızda kısmı gelecek"),
        ));
  }
}
