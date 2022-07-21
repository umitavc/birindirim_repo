import 'package:birindirm_deneme/public/product.dart';
import 'package:birindirm_deneme/screens/markalar_detay_screen.dart';
import 'package:flutter/material.dart';

class markalarView extends StatefulWidget {
  const markalarView({Key key}) : super(key: key);

  @override
  State<markalarView> createState() => _markalarViewState();
}

class _markalarViewState extends State<markalarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: product.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 4,
                  shadowColor: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(product[index].name),
                      subtitle: Text(product[index].altbaslik),
                      leading: SizedBox(child: Image.asset(product[index].logo)),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>markalarDetayScreenView()));
                      },
                    ),
                  ),
                ),
              );
            }));
  }
}
