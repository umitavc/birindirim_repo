import 'package:birindirm_deneme/core/extension/context_extension.dart';
import 'package:birindirm_deneme/core/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';

class PriceTextOpportunities extends StatelessWidget {
  final String text;
  final TextStyle style;

  const PriceTextOpportunities({Key key,  this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(padding: context.paddingLow, child: TextWidgetLocal(text: text,style: style,));
  }
}
