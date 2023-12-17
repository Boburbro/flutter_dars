import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:modul8_homework/providers/cart_item_provider.dart';
import 'package:provider/provider.dart';

class CartTitle extends StatelessWidget {
  const CartTitle(
      {required this.productId,
      required this.imgUrl,
      required this.title,
      required this.number,
      required this.price,
      super.key});

  final String imgUrl;
  final String title;
  final int number;
  final String productId;
  final double price;

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartItemProvider>(context);
    print(productId);
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .4,
        children: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text("Bu maxsulotni o'chirasimi?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Bekor qilish"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              _cart.removeItem(productId);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Ha"),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete_forever_rounded),
              label: const Text("Delete"))
        ],
      ),
      key: ValueKey(productId),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
          title: Text(title),
          subtitle: Text("Umumiy: \$${price * number}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => number > 1
                    ? _cart.removSingleItem(productId, title, imgUrl, price)
                    : {},
                icon: Icon(
                  Icons.remove_rounded,
                  color: number > 1 ? Colors.black : Colors.grey,
                ),
              ),
              Chip(label: Text(number.toString())),
              IconButton(
                onPressed: () =>
                    _cart.addNewCartItem(productId, title, imgUrl, price),
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
