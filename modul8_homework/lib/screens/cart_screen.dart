import 'package:flutter/material.dart';
import 'package:modul8_homework/providers/cart_item_provider.dart';
import 'package:modul8_homework/providers/order_rovider.dart';
import 'package:modul8_homework/widgets/cart_title.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartItemProvider>(context);
    final cartItems = cartData.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sizning savatchangiz"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Umumiy: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      "\$${cartData.totalPrice}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderProvider>(context, listen: false)
                          .addNewOrderItem(cartData.totalPrice, DateTime.now(),
                              cartData.items.values.toList());
                      cartData.clearCart();
                    },
                    child: const Text("Buyurtma berish"),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, index) {
                return CartTitle(
                  imgUrl: cartItems[index].imgUrl,
                  title: cartItems[index].title,
                  number: cartItems[index].quantity,
                  productId: cartData.items.keys.toList()[index],
                  price: cartItems[index].price,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
