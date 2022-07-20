import 'package:flutter/material.dart';

class Product {
  final String image, zaman, desc;
  //slug;
  final int id;

  //final Color color;

  Product({
    //required this.color,
     this.image,
     this.zaman,
     this.desc,
     this.id,
    //required this.slug
  });
}

List <Product> product =[
 Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 1,
   //slug: 'google',
  // color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'aldın aldın', 
   id: 2,
    //slug: 'youtube',
  // color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 3,
   // slug: 'twitter',
  // color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Aldın aldın', 
   id: 4,
    //slug: 'news',
   //color: Color(0xFF05B305),
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 5,
    //slug: 'eksi',
   //color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 6,
    //slug: 'reddit',
   //color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 7,
    //slug: 'reddit',
   //color: Color(0xFFF8FAF8),
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 7,
    //slug: 'reddit',
   //color: Color(0xFFF8FAF8),
   ),
];






