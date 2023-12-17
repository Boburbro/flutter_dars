import 'package:flutter/material.dart';
import '../model/cart_item.dart';
import '../model/order_item.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderItem> _items = [];
  List<OrderItem> get items {
    return [..._items];
  }

  void addNewOrderItem(
    double totalPrice,
    DateTime date,
    List<CartItem> products,
  ) {
    _items.insert(
      0,
      OrderItem(
        id: UniqueKey().toString(),
        totalPrice: totalPrice,
        date: date,
        products: products,
      ),
    );
    notifyListeners();
  }
}
