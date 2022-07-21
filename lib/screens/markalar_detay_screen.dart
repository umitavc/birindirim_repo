import 'package:birindirm_deneme/components/constant.dart';
import 'package:birindirm_deneme/public/product.dart';
import 'package:flutter/material.dart';

class markalarDetayScreenView extends StatelessWidget {
  const markalarDetayScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('101'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Material(
                      color: kButtonColor,
                      elevation: 4,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(),
                    ),
                  ),
                );
              }),
        ));
  }
}
