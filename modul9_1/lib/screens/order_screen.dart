import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/order_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<OrderProvider>(context, listen: false)
        .getOrderData()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Buyurtmalar"),
      ),
      body: _isLoading
          ? const Center(
              child: CupertinoActivityIndicator(
                color: CupertinoColors.activeBlue,
                radius: 20,
              ),
            )
          : orders.items.isEmpty
              ? const Center(
                  child: Text("Buyurtmalar mavjud emas!"),
                )
              : ListView.builder(
                  itemCount: orders.items.length,
                  itemBuilder: (ctx, i) {
                    final order = orders.items[i];
                    return OrderItem(
                        order.totalPrice, order.date, order.products);
                  },
                ),
      drawer: const AppDrawer(),
    );
  }
}
