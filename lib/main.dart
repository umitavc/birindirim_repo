import 'package:birindirm_deneme/screens/mainScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
//"hasan-deneme"
  // This widget is the root of your application.
  //conflict-2
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainScreens(),
 
      //conflict
 
      ///sfafasdfasdfajkajlfkja
 
    );
  }
}
