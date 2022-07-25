import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidgetLocal extends StatelessWidget {
  final String text;
  final TextStyle style;
  const TextWidgetLocal({Key key, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
