import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../service/http_exception.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorite {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  String? _token;
  String? _userId;

  void setToken(String? token, String? userId) {
    _token = token;
    _userId = userId;
  }

  Future<void> getProducts(bool filterByUser) async {
    final Uri url = filterByUser
        ? Uri.parse(
            'https://fir-app-aac00-default-rtdb.firebaseio.com/products.json?auth=$_token&orderBy="creatorId"&equalTo="$_userId"')
        : Uri.parse(
            'https://fir-app-aac00-default-rtdb.firebaseio.com/products.json?auth=$_token');

    try {
      final respons = await http.get(url);
      if (jsonDecode(respons.body) != null) {
        final Uri favoriteUrl = Uri.parse(
            "https://fir-app-aac00-default-rtdb.firebaseio.com/likes/$_userId.json?auth=$_token");

        final favoriteResponse = await http.get(favoriteUrl);
        final favoriteData = jsonDecode(favoriteResponse.body);
        final data = jsonDecode(respons.body) as Map<String, dynamic>;
        final List<Product> loadedProducts = [];

        data.forEach((productId, value) {
          loadedProducts.add(Product(
            id: productId,
            title: value['title'],
            price: value['price'],
            des: value['description'],
            imgUrl: value['imgUrl'],
            isFavorite:
                favoriteData == null ? false : favoriteData[productId] ?? false,
          ));
        });
        _items = loadedProducts;
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addNewProduct(Product product) async {
    final Uri url = Uri.parse(
        "https://fir-app-aac00-default-rtdb.firebaseio.com/products.json?auth=$_token");

    try {
      final respons = await http.post(
        url,
        body: jsonEncode(
          {
            'title': product.title,
            'price': product.price,
            'description': product.des,
            'imgUrl': product.imgUrl,
            'creatorId': _userId,
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

  Future<void> editProduct(Product editedProduct) async {
    final productIndex =
        _items.indexWhere((element) => editedProduct.id == element.id);
    if (productIndex >= 0) {
      try {
        final Uri url = Uri.parse(
            "https://fir-app-aac00-default-rtdb.firebaseio.com/products/${editedProduct.id}.json?auth=$_token");
        await http.patch(
          url,
          body: jsonEncode(
            {
              'description': editedProduct.des,
              'price': editedProduct.price,
              'title': editedProduct.title,
              'imgUrl': editedProduct.imgUrl,
            },
          ),
        );
        _items[productIndex] = editedProduct;
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> deleteById(String id) async {
    final Uri url = Uri.parse(
        "https://fir-app-aac00-default-rtdb.firebaseio.com/products/$id.json?auth=$_token");

    try {
      final deletingPeoduct = _items.firstWhere((element) => element.id == id);
      final deletingProductIndex =
          _items.indexWhere((element) => element.id == id);
      _items.removeWhere((element) => element.id == id);
      notifyListeners();

      final respons = await http.delete(url);
      _items.removeWhere((element) => element.id == id);

      if (respons.statusCode != 200) {
        _items.insert(deletingProductIndex, deletingPeoduct);
        notifyListeners();
        throw HttpException(message: "Xatolik bor!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
