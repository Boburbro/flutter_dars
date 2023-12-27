import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String des;
  final String imgUrl;
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.des,
    required this.imgUrl,
    this.isFavorite = false,
  });

  Future<void> changeFavorite() async {
    var old = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    try {
      final Uri url = Uri.parse(
          "https://fir-app-aac00-default-rtdb.firebaseio.com/products/$id.json");
      final respons = await http.patch(
        url,
        body: jsonEncode(
          {'isFavorite': isFavorite},
        ),
      );
      if (respons.statusCode != 200) {
        isFavorite = old;
        notifyListeners();
      }
    } catch (e) {
      isFavorite = old;
      notifyListeners();
      rethrow;
    }
  }
}
