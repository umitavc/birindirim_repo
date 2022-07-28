
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BrandsDetailScreen extends StatefulWidget {
  const BrandsDetailScreen({Key key,  }) : super(key: key);

  @override
  State<BrandsDetailScreen> createState() => _BrandsDetailScreen();
}

class _BrandsDetailScreen extends State<BrandsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("markalar")),
    );
  }
}