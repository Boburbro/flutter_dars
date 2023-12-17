import './cart_item.dart';

class OrderItem {
  final String id;
  final double totalPrice;
  final DateTime date;
  final List<CartItem> products;

  OrderItem({
    required this.id,
    required this.totalPrice,
    required this.date,
    required this.products,
  });
}
