import 'package:auto_size_text/auto_size_text.dart';
import 'package:birindirm_deneme/core/constant/app/image_constant.dart';
import 'package:birindirm_deneme/core/constant/app/string_constant.dart';
import 'package:birindirm_deneme/core/extension/context_extension.dart';
import 'package:birindirm_deneme/screens/coupons/model/coupons_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/init/locator.dart';
import '../view_model/coupons_view_model.dart';

class CouponsView extends StatefulWidget {
  const CouponsView({Key key}) : super(key: key);

  @override
  State<CouponsView> createState() => _CouponsViewState();
}

class _CouponsViewState extends State<CouponsView> {
  @override
  void initState() {
    super.initState();

    context.read<CouponsViewModel>().fetcAllCoupoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () => context.read<CouponsViewModel>().refreshIndicator(),
          child: context.watch<CouponsViewModel>().isLoading ? const Center(child: CircularProgressIndicator()) : fetchBodyGridview(context)),
    );
  }

  Widget fetchBodyGridview(BuildContext context) {
    return GridView.builder(
        itemCount: context.watch<CouponsViewModel>().couponList?.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 5,
          childAspectRatio: 2 / 3.6,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: gridviewCardItem(context, context.watch<CouponsViewModel>().couponList.elementAt(index)),
          );
        });
  }

  Widget gridviewCardItem(BuildContext context, model) {
    return Card(
      child: Container(
        color: Colors.white,
        child: gridViewColumn(context, model),
      ),
    );
  }

  Column gridViewColumn(BuildContext context, CouponsModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          height: context.dymaicWidth(0.4),
          child: Stack(
            children: [
              fetchStackImage(context, model.brand),
              fetchStackCenterCard(model),
            ],
          ),
        ),
        Expanded(child: buildTextTitle(model)),
        Expanded(
          child: buildTextDescription(model),
        ),
        fetchButton(model.link.launchToString)
      ],
    );
  }

  Container fetchStackImage(BuildContext context, String image) {
    return Container(
      padding: const EdgeInsets.only(bottom: 22),
      height: context.dymaicWidth(0.3),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.instance.couponsCodePng), fit: BoxFit.fill)),
    );
  }

  Widget fetchStackCenterCard(CouponsModel model) {
    return Positioned(
      bottom: 15,
      left: 30,
      right: 30,
      child: Card(
        shadowColor: Colors.white,
        child: centerTextWidget(model),
      ),
    );
  }

  Widget centerTextWidget(CouponsModel model) {
    return Container(
      height: 40,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Container(
        padding: const EdgeInsets.only(bottom: 22),
        height: context.dymaicWidth(0.3),
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(model.image), fit: BoxFit.fill)),
      )),
    );
  }

  Widget buildTextTitle(CouponsModel model) {
    return Padding(
      padding: context.paddingLow,
      child: AutoSizeText(
        model.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildTextDescription(CouponsModel model) {
    return Padding(
      padding: context.paddingLow,
      child: AutoSizeText(
        model.description,
        maxLines: 2,
      ),
    );
  }

  ElevatedButton fetchButton(String link) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        onPressed: () {
          locator<CouponsViewModel>().goToLink(link);
        },
        child: const Center(child: Text("Siteye Git", style: TextStyle(color: Colors.white))));
  }
}
