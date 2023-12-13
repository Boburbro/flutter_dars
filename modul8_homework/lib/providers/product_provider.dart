import 'package:flutter/material.dart';
import 'package:modul8_homework/model/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: "p1",
      title: "Samsung s23",
      price: 980.0,
      description: "Eng zo'ri",
      imgUrl:
          "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p2",
      title: "Smart watch",
      price: 50,
      description: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p3",
      title: "Smart watch",
      price: 100,
      description: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }
}
