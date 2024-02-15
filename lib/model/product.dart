import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  bool favorite;
  double? size;
  final Widget image;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.size,
    required this.favorite,
  });
}

final List<Product> PRODUCTS = [
  Product(
    id: 0,
    name: "Laptop",
    price: 1900,
    favorite: false,
    image: const Image(
      image: AssetImage("assets/images/laptop.png"),
      height: 100,
      width: 150,
    ),
  ),
  Product(
    id: 1,
    name: "Phone",
    price: 800,
    favorite: false,
    image: const Image(
      image: AssetImage("assets/images/smartphone.png"),
      height: 100,
      width: 150,
    ),
  ),
  Product(
    id: 2,
    name: "Watch",
    price: 500,
    favorite: false,
    image: const Image(
      image: AssetImage("assets/images/applewatch.png"),
      height: 100,
      width: 150,
    ),
  ),
  Product(
    id: 3,
    name: "TV",
    price: 650,
    favorite: false,
    image: const Image(
      image: AssetImage("assets/images/4ktv.png"),
      height: 100,
      width: 150,
    ),
  ),
  Product(
    id: 4,
    name: "Drone Camera",
    price: 1900,
    favorite: false,
    image: const Image(
      image: AssetImage("assets/images/cameradrone.png"),
      height: 100,
      width: 150,
    ),
  ),
  Product(
    id: 5,
    name: "Desktop PC",
    price: 1900,
    favorite: false,
    image: const Image(
      image: AssetImage("assets/images/desktop.png"),
      height: 100,
      width: 150,
    ),
  ),
  Product(
    id: 6,
    name: "Speaker ",
    price: 1900,
    favorite: false,
    image: const Image(
      image: AssetImage("assets/images/speaker.png"),
      height: 100,
      width: 150,
    ),
  ),
];
