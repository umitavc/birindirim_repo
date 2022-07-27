
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreens extends StatefulWidget {
  final String topic;
  const DetailScreens({Key key, this.topic,  }) : super(key: key);

  @override
  State<DetailScreens> createState() => _DetailScreensState();
}

class _DetailScreensState extends State<DetailScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("topic"),
      ),
    );
  }
}