import 'package:birindirm_deneme/core/constant/app/image_constant.dart';
import 'package:birindirm_deneme/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class NetworkExceptionCard extends StatelessWidget {
  final void Function() onPresssed;
  const NetworkExceptionCard({
    Key key,
    this.onPresssed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildAssetImage(context),
          buildNetworkErrorButton(context),
        ],
      ),
    );
  }

  Widget buildAssetImage(BuildContext context) {
    return Image.asset(ImageConstant.instance.networkMistake);
  }

  Widget buildNetworkErrorButton(BuildContext context) {
    return InkWell(
      onTap: onPresssed,
      child: Padding(
        padding: context.paddingHighHorizontal,
        child: Container(
            width: double.infinity,
            height: context.dymaicHeight(0.06),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Center(
                child: Text(
              "Tekrar Baglan",
              style: context.textThem.headline6.copyWith(color: context.colors.onSecondary, fontSize: 18),
            ))),
      ),
    );
  }
}
