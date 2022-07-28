
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopulerDetailScreens extends StatefulWidget {
  final String topic;
  const PopulerDetailScreens({Key key, this.topic,  }) : super(key: key);

  @override
  State<PopulerDetailScreens> createState() => _PopulerDetailScreens();
}

class _PopulerDetailScreens extends State<PopulerDetailScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("topic"),
      ),
    );
  }
}