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
  late Future _orderFuture;

  Future _getOrderFuture() {
    return Provider.of<OrderProvider>(context, listen: false).getOrderData();
  }

  @override
  void initState() {
    _orderFuture = _getOrderFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Buyurtmalar"),
      ),
      body: FutureBuilder(
        future: _orderFuture,
        builder: (ctx, dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: CupertinoColors.activeBlue,
                radius: 20,
              ),
            );
          } else {
            if (dataSnapShot.error == null) {
              return Consumer<OrderProvider>(
                builder: (context, orders, child) => orders.items.isEmpty
                    ? const Center(child: Text("Buyurtmalar mavjud emas!"))
                    : ListView.builder(
                        itemCount: orders.items.length,
                        itemBuilder: (ctx, i) {
                          final order = orders.items[i];
                          return OrderItem(
                            order.totalPrice,
                            order.date,
                            order.products,
                          );
                        },
                      ),
              );
            } else {
              return const Center(child: Text("Xatolik!"));
            }
          }
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
