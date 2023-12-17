import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modul8_homework/providers/order_rovider.dart';
import 'package:modul8_homework/widgets/app_drower.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routeName = '/order-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Buyurtmalar"),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: orderData.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 20),
                title: Text("\$${orderData[index].totalPrice}"),
                subtitle: Text(
                  DateFormat('dd/MM/yyyy hh:mm').format(orderData[index].date),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
                children: orderData[index]
                    .products
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("x${e.quantity}  \$${e.price}"),
                        ],
                      ),
                    )
                    .toList(),
              ),
            );
          }),
    );
  }
}
