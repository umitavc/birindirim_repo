
import 'package:flutter/material.dart';
import '../../screens/brands_view/model/brands_model.dart';
import '../../screens/brands_view/view/brands_detail_view.dart';


class BrandsCard extends StatelessWidget {
  final BrandsModel product;
  final VoidCallback press;
  const BrandsCard({Key key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 4,
                shadowColor: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(

                    title: Text(product.title),
                    subtitle: Text(product.link),
                    leading: SizedBox(child: Image.network(product.logo)),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BrandsdetailScreenView(topic: product.title,)));
                    },
                  ),
                ),
              ),
            );
  }
}