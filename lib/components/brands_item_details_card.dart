import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../screens/brands_view/model/brandsDetails_model.dart';
import 'constant.dart';

class BrandsItemDetailsCard extends StatelessWidget {
  final BrandsDetailsModel product;
  const BrandsItemDetailsCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        //onTap: press,
        child: Material(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(16),
          elevation: 4,
          shadowColor: Colors.grey.shade300,
          child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      product.image,
                    ),
                  ),
                  Text(product.title, style: TextStyle(color: kTextColor, fontSize: 16)),
                  Text(product.time, style: TextStyle(color: kTextLightColor, fontSize: 14))
                ],
              )),
        ),
      ),
    );
  }
}
