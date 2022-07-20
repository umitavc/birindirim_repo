import 'package:flutter/material.dart';

class Product {
  final String image, zaman, desc;
  //slug;
  final int id;

  

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
   //slug: '',
  
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'aldın aldın', 
   id: 2,
    //slug: '',
  
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 3,
   // slug: '',
  
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Aldın aldın', 
   id: 4,
    //slug: '',
   
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 5,
    //slug: '',
   
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 6,
    //slug: '',
   
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 7,
    //slug: 'reddit',
   
   ),
   Product(
  image: 'assets/images/bim.jpg',
   zaman: 'Bugün bitiyor', 
   desc: 'Haftanın fırstalarını kaçırma', 
   id: 7,
    //slug: '',
   
   ),
];






