import 'package:flutter/material.dart';
import 'package:modul8_1/models/product.dart';
import 'package:modul8_1/widgets/product_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  static const routeName = "/";

  HomeScreen({super.key});

  List<Product> list = Products().items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mening do'konim"),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (ctx, i) {
            return ProductItem(list[i]);
          }),
    );
  }
}
