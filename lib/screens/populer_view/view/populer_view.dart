import 'package:birindirm_deneme/components/item_Card.dart';
import 'package:birindirm_deneme/core/utils/enums/fetch_status_enum.dart';
import 'package:birindirm_deneme/screens/populer_view/viewmodel/popular_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/constant.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key key}) : super(key: key);

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: ChangeNotifierProvider(
              create: (context) => HomViewModel()..fetchPopularProducts(),
              child: Consumer<HomViewModel>(
                builder: (BuildContext context, value, Widget child) {
                  if (value.status == FetchStatus.error) return const Text("Error");
                  if (value.status == FetchStatus.loading) return const Center(child: CircularProgressIndicator());
                  return GridView.builder(
                    itemCount: context.read<HomViewModel>().modelList?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.60,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      product: context.read<HomViewModel>().modelList.elementAt(index),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
