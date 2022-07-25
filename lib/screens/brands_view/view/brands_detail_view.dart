import 'package:birindirm_deneme/components/constant.dart';
import 'package:birindirm_deneme/public/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/widget_card/brands_item_details_card.dart';
import '../../../core/utils/enums/fetch_status_enum.dart';
import '../viewmodel/brandsDetails_view_model.dart';

class BrandsdetailScreenView extends StatelessWidget {
  final String topic;
  const BrandsdetailScreenView({Key key, @required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(topic),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ChangeNotifierProvider(
            create: (context) => BrandsDetailsViewModel()..fetchBrandsDetailsProducts(),
            child: Consumer<BrandsDetailsViewModel>(
              builder: (BuildContext context, value, Widget child){
                if (value.status == FetchStatus.error) return const Text("Error");
                  if (value.status == FetchStatus.loading) return const Center(child: CircularProgressIndicator());
                  return GridView.builder(
                  itemCount: context.read<BrandsDetailsViewModel>().modelList.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                  ),
                  itemBuilder: (BuildContext context, int index) =>BrandsItemDetailsCard(
                    product:context.read<BrandsDetailsViewModel>().modelList.elementAt(index),
                  )
                    
                  
                  );
              }
              
            ),
          ),
        ));
  }

  
}
