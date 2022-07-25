import 'package:birindirm_deneme/screens/drawer_view/iconPage/hakkimizda.dart';
import 'package:birindirm_deneme/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';




class DrawerWidget extends StatelessWidget {
   DrawerWidget({Key key}) : super(key: key);
final padding =EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.amber.shade700,
        child: ListView(
          padding: padding,
          children: [
             const SizedBox(height: 48,),
            builMenuItem(
              text:'Anasayfa',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(height: 16,),
            builMenuItem(
              text:'Hakkımızda',
              icon: Icons.wrap_text,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(height: 16,),
            builMenuItem(
              text:'Değerlendir/Puan Ver!',
              icon: Icons.thumb_up,
            ),SizedBox(height: 16,),
            builMenuItem(
              text:'Arkadaşınla Paylaş',
              icon: Icons.share,
            ),
          ],
        ),
      ),
    );
  }

  Widget builMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading:  Icon(icon, color: color,),
      title: Text(text,style: TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context,int index){
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreens()));
        break;

        case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HakkimizdaView()));
        break;
      

      
    }
  }
}
