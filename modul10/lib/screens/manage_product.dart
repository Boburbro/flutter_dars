import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/products.dart';

class ManageProduct extends StatelessWidget {
  static const routeName = "/manage_product";

  const ManageProduct({super.key});

  Future<void> _refresh(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).getProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Product"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProduct.routeName);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refresh(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CupertinoActivityIndicator(
                    color: CupertinoColors.activeBlue));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: () => _refresh(context),
              child: Consumer<Products>(builder: (c, productsModel, _) {
                return ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: productsModel.items.length,
                  itemBuilder: (ctx, index) {
                    final product = productsModel.items[index];
                    return ChangeNotifierProvider.value(
                      value: product,
                      child: const UserProductItem(),
                    );
                  },
                );
              }),
            );
          } else {
            return const Center(child: Text("Xatolik bor"));
          }
        },
      ),
    );
  }
}
