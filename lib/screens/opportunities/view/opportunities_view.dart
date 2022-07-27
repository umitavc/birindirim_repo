import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/context_extension.dart';
import '../../_product/text/price_text.dart';
import '../model/opportunities_model.dart';
import '../view_model/opportunities_view_model.dart';

class OpportunitiesView extends StatefulWidget {
  const OpportunitiesView({Key key}) : super(key: key);

  @override
  State<OpportunitiesView> createState() => _OpportunitiesViewState();
}

class _OpportunitiesViewState extends State<OpportunitiesView> {
  OpportunitiesViewModel viewModel;
  @override
  void initState() {
    super.initState();

    viewModel = OpportunitiesViewModel();
    context.read<OpportunitiesViewModel>().fetcAllOpportunities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<OpportunitiesViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: context.watch<OpportunitiesViewModel>().modelList?.length ?? 0,
                itemBuilder: (context, index) {
                  OpportunitiesModel model = OpportunitiesModel.fromJson(context.watch<OpportunitiesViewModel>().modelList[index]);
                  return _withContainer(context, model);
                },
              ));
  }

  Widget _withContainer(BuildContext context, OpportunitiesModel model) {
    return Container(
      padding: context.paddingLow,
      height: context.dymaicWidth(0.5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            fetchImage(context, model),
            fetchColumn(context, model),
          ],
        ),
      ),
    );
  }

  Widget fetchImage(BuildContext context, OpportunitiesModel model) {
    return Expanded(
      flex: 1,
      child: Container(
        height: context.dymaicWidth(0.4),
        decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(image: NetworkImage(model.image), fit: BoxFit.fill),
        ),
      ),
    );
  }

  Widget fetchColumn(BuildContext context, OpportunitiesModel model) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: fecthColumnName(model, context),
            ),
            Expanded(
              child: fetchColumnPrice(context, model),
            )
          ],
        ),
      ),
    );
  }

  Widget fecthColumnName(OpportunitiesModel model, BuildContext context) {
    return AutoSizeText(
      model.title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: context.textThem.headline6.copyWith(fontSize: 16, letterSpacing: 1),
    );
  }

  Widget fetchColumnPrice(BuildContext context, OpportunitiesModel model) {
    return GestureDetector(
      onTap: (() => viewModel.goToLink(model.link)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: oldPriceText(context, model)),
                Expanded(child: newPriceText(context, model)),
              ],
            ),
            fetchRowIcon(context),
          ],
        ),
      ),
    );
  }

  Widget oldPriceText(BuildContext context, OpportunitiesModel model) {
    return PriceTextOpportunities(
      text: model.oldPrice,
      style: context.textThem.bodyMedium.copyWith(color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.w700),
    );
  }
}

Widget newPriceText(BuildContext context, OpportunitiesModel model) {
  return PriceTextOpportunities(text: model.newPrice, style: context.textThem.bodyMedium.copyWith(color: Colors.orange, fontWeight: FontWeight.w700));
}

Widget fetchRowIcon(BuildContext context) {
  return const Center(
      child: Icon(
    Icons.arrow_forward_ios,
    color: Colors.orange,
    size: 20,
  ));
}
