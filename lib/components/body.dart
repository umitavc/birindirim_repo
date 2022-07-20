import 'package:birindirm_deneme/components/constant.dart';
import 'package:birindirm_deneme/components/item_Card.dart';
import 'package:birindirm_deneme/public/product.dart';
import 'package:flutter/material.dart';

import 'detalis_screens.dart';

class BodyView extends StatefulWidget {
  const BodyView({Key key}) : super(key: key);

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
 /*  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List _widgetOptions = [
    Text(
      'Index 0: Popüller',
      style: optionStyle,
    ),
    Text(
      'Index 1: Markalar',
      style: optionStyle,
    ),
    Text(
      'Index 2: Fırsatlar',
      style: optionStyle,
    ),
    Text(
      'Index 3: Kuponlar',
      style: optionStyle,
    ),
  ]; */

  /* void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                itemCount: product.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.60),

                    
                //diğer sayfaya yönlendirme işlemi burda oluyor
                itemBuilder: (context, index) => itemCard(
                    product: product[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreens(product: product[index])))), 
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.dark_mode_rounded),
        backgroundColor: Colors.amber.shade800,
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.amber.shade600,
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTabItem(
              index: 0,
              baslik: Text("Popüler",style: TextStyle(color: Colors.red),)
            ),
            buildTabItem(
              index: 1,
              baslik: Text("Markalar",style: TextStyle(color: Colors.white),)
              
            
            ),
            buildTabItem(
              index: 2,
              baslik: Text("Fırsatlar",style: TextStyle(color: Colors.white),)
              
            ),
            buildTabItem(
              index: 3,
              baslik: Text("Kuponlar",style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
      ),
      /* bottomNavigationBar: BottomNavigationBar(
      
        items: const <BottomNavigationBarItem> [
        
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Text("Popüller"),
            ),
            label: "",
            
          ),
          BottomNavigationBarItem(
         icon: SizedBox(
              child: Text("Markalar"),
            ),
         label: ""
          ),
          BottomNavigationBarItem(
           icon: SizedBox(
              child: Text("Fırsatlar"),
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Text("Kuponlar"),
            ),
            label: "",
            
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ) , */
    );
  }
  Widget buildTabItem ({
 int index,
 Widget  baslik,// Icon icon olunca sadece icon türünde değişken verebiliyorsun ama widget  ile her türde değiişken verirsin 
  }) {
    return IconButton(onPressed: (){}, 
    icon: baslik, 
    iconSize: 56,);
  }
}