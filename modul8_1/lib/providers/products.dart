import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: "p1",
      title: "Samsung s23",
      price: 980.0,
      des: "Eng zo'ri",
      imgUrl:
          "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p2",
      title: "Smart watch",
      price: 50,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p3",
      title: "Smart watch",
      price: 100,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p4",
      title: "Apple",
      price: 2000,
      des: "Yaxshi kompyuter",
      imgUrl:
          "https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
        Product(
      id: "p5",
      title: "Samsung s23",
      price: 980.0,
      des: "Eng zo'ri",
      imgUrl:
          "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p6",
      title: "Smart watch",
      price: 50,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p7",
      title: "Smart watch",
      price: 100,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p8",
      title: "Apple",
      price: 2000,
      des: "Yaxshi kompyuter",
      imgUrl:
          "https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
        Product(
      id: "p9",
      title: "Samsung s23",
      price: 980.0,
      des: "Eng zo'ri",
      imgUrl:
          "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p10",
      title: "Smart watch",
      price: 50,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "p11",
      title: "Smart watch",
      price: 100,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: "q12",
      title: "Apple",
      price: 2000,
      des: "Yaxshi kompyuter",
      imgUrl:
          "https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
        Product(
      id: "p13",
      title: "Samsung s23",
      price: 980.0,
      des: "Eng zo'ri",
      imgUrl:
          "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Smart watch",
      price: 50,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Smart watch",
      price: 100,
      des: "eng zamonavi fitnes soat",
      imgUrl:
          "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Apple",
      price: 2000,
      des: "Yaxshi kompyuter",
      imgUrl:
          "https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorite {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
