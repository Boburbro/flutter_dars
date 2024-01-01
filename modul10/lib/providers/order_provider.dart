// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/cart_item.dart';
import '../models/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _items = [];
  List<Order> get items {
    return [..._items];
  }

  String? _token;
  String? _userId;

  void setToken(String? token, String? userId) {
    _token = token;
    _userId = userId;
  }

  Future<void> getOrderData() async {
    final Uri url = Uri.parse(
        'https://fir-app-aac00-default-rtdb.firebaseio.com/order$_userId.json?auth=$_token');

    try {
      final response = await http.get(url);
      if (jsonDecode(response.body) == null) {
        return;
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      List<Order> loadedOrders = [];
      data.forEach(
        (orderId, order) {
          loadedOrders.insert(
              0,
              Order(
                  id: orderId,
                  totalPrice: order['totalPrice'],
                  date: DateTime.parse(order['date']),
                  products: (order['products'] as List<dynamic>)
                      .map(
                        (product) => CartItem(
                          id: product['id'],
                          title: product['title'],
                          imgUrl: product['imgUrl'],
                          quantity: product['quantity'],
                          price: product['price'],
                        ),
                      )
                      .toList()));
        },
      );
      _items = loadedOrders;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addNewOrder(List<CartItem> products, double totalPrice) async {
    final Uri url = Uri.parse(
        "https://fir-app-aac00-default-rtdb.firebaseio.com/order/$_userId.json?auth=$_token");
    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            'creatorId': _userId,
            'totalPrice': totalPrice,
            'date': DateTime.now().toIso8601String(),
            'products': products
                .map(
                  (e) => {
                    'id': e.id,
                    'title': e.title,
                    'quantity': e.quantity,
                    'price': e.price,
                    'imgUrl': e.imgUrl
                  },
                )
                .toList(),
          },
        ),
      );

      if (response.statusCode == 200) {
        _items.insert(
          0,
          Order(
            id: jsonDecode(response.body)['name'],
            totalPrice: totalPrice,
            date: DateTime.now(),
            products: products,
          ),
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}
