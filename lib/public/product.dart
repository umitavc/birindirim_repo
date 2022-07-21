import 'package:flutter/material.dart';

class Product {
  final String image, zaman, desc, logo, name, altbaslik;
  //slug;
  final int id;

  Product({
    //required this.color,
    this.image,
    this.zaman,
    this.desc,
    this.id,
    this.logo,
    this.name,
    this.altbaslik,
    //required this.slug
  });
}

List<Product> product = [
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'Haftanın fırstalarını kaçırma',
    id: 1,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    //slug: '',
  ),
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'aldın aldın',
    id: 2,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    //slug: '',
  ),
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'Haftanın fırstalarını kaçırma',
    id: 3,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    // slug: '',
  ),
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'Aldın aldın',
    id: 4,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    //slug: '',
  ),
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'Haftanın fırstalarını kaçırma',
    id: 5,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    //slug: '',
  ),
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'Haftanın fırstalarını kaçırma',
    id: 6,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    //slug: '',
  ),
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'Haftanın fırstalarını kaçırma',
    id: 7,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    //slug: 'reddit',
  ),
  Product(
    image: 'assets/images/bim.jpg',
    zaman: 'Bugün bitiyor',
    desc: 'Haftanın fırstalarını kaçırma',
    id: 7,
    logo: 'assets/images/bimlogo.jpg',
    name: "bim",
    altbaslik: "Broşüleri görüntüle",
    //slug: '',
  ),
];
