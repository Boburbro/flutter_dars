import 'package:flutter/material.dart';
import 'package:modul9_1/screens/order_screen.dart';
import 'package:provider/provider.dart';

import '../providers/card_provider.dart';
import '../providers/order_provider.dart';
import '../widgets/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sizning savatchangiz"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Umumiy: ",
                    // ignore: deprecated_member_use
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
                  OrderButtonBuilder(cartData: cartData)
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (c, i) {
                final cartItem = cartData.items.values.toList()[i];
                return CartListItem(
                  proId: cartData.items.keys.toList()[i],
                  imgUrl: cartItem.imgUrl,
                  title: cartItem.title,
                  price: cartItem.price,
                  quantity: cartItem.quantity,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderButtonBuilder extends StatefulWidget {
  const OrderButtonBuilder({
    super.key,
    required this.cartData,
  });

  final CartProvider cartData;

  @override
  State<OrderButtonBuilder> createState() => _OrderButtonBuilderState();
}

class _OrderButtonBuilderState extends State<OrderButtonBuilder> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (widget.cartData.items.isEmpty || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<OrderProvider>(context, listen: false)
                  .addNewOrder(
                widget.cartData.items.values.toList(),
                widget.cartData.totalPrice,
              );
              widget.cartData.clearItems();
              setState(() {
                _isLoading = false;
              });
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
      child: _isLoading
          ? const CircularProgressIndicator()
          : const Text("Buyurtma berish"),
    );
  }
}
