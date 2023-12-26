import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    // Product(
    //   id: "p1",
    //   title: "Samsung s23",
    //   price: 980.0,
    //   des: "Eng zo'ri",
    //   imgUrl:
    //       "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=1600",
    // ),
    // Product(
    //   id: "p2",
    //   title: "Smart watch",
    //   price: 50,
    //   des: "eng zamonavi fitnes soat",
    //   imgUrl:
    //       "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    // ),
    // Product(
    //   id: "p3",
    //   title: "Smart watch",
    //   price: 100,
    //   des: "eng zamonavi fitnes soat",
    //   imgUrl:
    //       "https://images.pexels.com/photos/3927389/pexels-photo-3927389.jpeg?auto=compress&cs=tinysrgb&w=1600",
    // ),
    // Product(
    //   id: "p4",
    //   title: "Apple",
    //   price: 2000,
    //   des: "Yaxshi kompyuter",
    //   imgUrl:
    //       "https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?auto=compress&cs=tinysrgb&w=1600",
    // ),
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

  Future<void> getProducts() async {
    final Uri url = Uri.parse(
        "https://fir-app-aac00-default-rtdb.firebaseio.com/products.json");
    try {
      final respons = await http.get(url);
      print(jsonDecode(respons.body));
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addNewProduct(Product product) async {
    final Uri url = Uri.parse(
        "https://fir-app-aac00-default-rtdb.firebaseio.com/products.json");

    try {
      final respons = await http.post(
        url,
        body: jsonEncode(
          {
            'title': product.title,
            'price': product.price,
            'description': product.des,
            'imgUrl': product.imgUrl,
            'isFavorite': product.isFavorite
          },
        ),
      );
      final id = (jsonDecode(respons.body) as Map<String, dynamic>)['name'];
      final Product newProduct = Product(
        id: id,
        title: product.title,
        price: product.price,
        des: product.des,
        imgUrl: product.imgUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  void editProduct(Product editedProduct) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _productId =
        _items.indexWhere((element) => element.id == editedProduct.id);
    _items[_productId] = editedProduct;
    notifyListeners();
  }

  void deleteById(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
