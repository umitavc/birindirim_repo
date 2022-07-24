
import 'package:birindirm_deneme/screens/brands_view/view/brands_detail_view.dart';
import 'package:birindirm_deneme/screens/brands_view/model/brands_model.dart';
import 'package:birindirm_deneme/screens/brands_view/viewmodel/brands_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/brands_item_Card.dart';
import '../../../core/utils/enums/fetch_status_enum.dart';

class BrandsView extends StatefulWidget {
  const BrandsView({Key key}) : super(key: key);

  @override
  State<BrandsView> createState() => _BrandsViewState();
}

class _BrandsViewState extends State<BrandsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => BrandsViewModel()..fetchBrandsProducts(),
          child:Consumer<BrandsViewModel>(builder:(BuildContext context, value, Widget child){
             if (value.status == FetchStatus.error) return const Text("Error");
                  if (value.status== FetchStatus.loading) return const Center(child: CircularProgressIndicator());
                  return ListView.builder(
              itemCount: context.read<BrandsViewModel>().modelList.length ?? 0,
              itemBuilder: ( context, index)=>BrandsCard(
                product: context.read<BrandsViewModel>().modelList.elementAt(index),
              )
              
              ); 
          }
          )
        )
            );
  }

}
