import 'package:birindirm_deneme/components/constant.dart';
import 'package:birindirm_deneme/components/populer_item_Card.dart';
import 'package:birindirm_deneme/public/product.dart';
import 'package:birindirm_deneme/screens/populer_view/view/populer_view.dart';
import 'package:flutter/material.dart';

import '../components/details_screens.dart';
import 'brands_view/view/brands_view.dart';

class BodyView extends StatefulWidget {
  const BodyView({Key key}) : super(key: key);

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  int _currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pageItems = [
      //ümit
      PopularView(),
      BrandsView(),

      //kerem
      const Center(
        child: Text("naslsn"),
      ),
      const Center(
        child: Text("iyiim"),
      ),
    ];
    return Scaffold(
      body: PageView.builder(
          itemCount: pageItems.length,
          onPageChanged: (index) {
            setState(() {
              _currenIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return pageItems[_currenIndex];
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.dark_mode_rounded),
          backgroundColor: Colors.amber.shade800,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Text(
              "Popüler",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            label: "",
          ),
          BottomNavigationBarItem(backgroundColor: Colors.orange, icon: Text("Markalar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)), label: ""),
          BottomNavigationBarItem(backgroundColor: Colors.orange, icon: Text("Fırsatlar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)), label: ""),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Text("Kuponlar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)),
            label: "",
          ),
        ],
        currentIndex: _currenIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _currenIndex = index;
          });
        },
      ),
    );
  }

  Widget buildTabItem({
    int index,
    Widget baslik, // Icon icon olunca sadece icon türünde değişken verebiliyorsun ama widget  ile her türde değiişken verirsin
  }) {
    return IconButton(
      onPressed: () {},
      icon: baslik,
      iconSize: 56,
    );
  }
}
