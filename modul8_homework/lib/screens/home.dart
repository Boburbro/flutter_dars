import 'package:flutter/material.dart';
import 'package:modul8_homework/model/product.dart';
import 'package:modul8_homework/providers/product_provider.dart';
import 'package:modul8_homework/widgets/app_drower.dart';
import 'package:modul8_homework/widgets/product_data.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const routeName = '/';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mening do'konim"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    "0",
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: productData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider<Product>.value(
            value: productData[index],
            child: const ProductData(),
          );
        },
      ),
    );
  }
}
