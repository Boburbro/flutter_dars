import 'package:flutter/material.dart';
import 'package:modul8_homework/model/cart_item.dart';

class CartItemProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addNewCartItem(
    String proId,
    String title,
    String imgUrl,
    double price,
  ) {
    if (_items.containsKey(proId)) {
      //soni ko'paytradi

      _items.update(
        proId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          imgUrl: value.imgUrl,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        proId,
        () => CartItem(
          id: UniqueKey().toString(),
          title: title,
          imgUrl: imgUrl,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void removSingleItem(
    String proId,
    String title,
    String imgUrl,
    double price,
  ) {
    if (_items.containsKey(proId)) {
      //soni ko'paytradi
      _items.update(
        proId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          imgUrl: value.imgUrl,
          quantity: value.quantity - 1,
          price: value.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(productId) {
    _items.removeWhere((key, value) => key == productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
