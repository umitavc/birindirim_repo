import 'package:birindirm_deneme/components/constant.dart';
import 'package:birindirm_deneme/screens/populer_view/model/product_model.dart';
import 'package:flutter/material.dart';

class PopulerItemCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback press;
  const PopulerItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: press,
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
                  if (product.image != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(product.image),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                    child: Text(product.title, textAlign: TextAlign.center, style: TextStyle(color: kTextColor, fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                    child: Text(product.time, style: TextStyle(color: kTextLightColor, fontSize: 12, fontWeight: FontWeight.w500)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
