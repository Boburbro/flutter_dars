import 'package:flutter/material.dart';
import 'package:modul8_1/providers/card_provider.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    required this.proId,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.quantity,
    super.key,
  });
  final String proId;
  final String imgUrl;
  final String title;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
        title: Text(title),
        subtitle: Text("Umumiy: \$ ${price * quantity}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () =>
                    cart.removeSingleItem(proId),
                icon: const Icon(Icons.remove, color: Colors.black)),
            Chip(label: Text(quantity.toString())),
            IconButton(
                onPressed: () =>
                    cart.addNewCartItem(proId, title, imgUrl, price)  ,
                icon: const Icon(Icons.add, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
