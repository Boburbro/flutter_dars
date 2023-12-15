import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/product_provider.dart';
import 'product_data.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody(this.showFavoriteScreen, {super.key});

  final bool showFavoriteScreen;

  @override
  Widget build(BuildContext context) {
    final productData = showFavoriteScreen
        ? Provider.of<ProductProvider>(context).favoritedItems
        : Provider.of<ProductProvider>(context).items;

    return GridView.builder(
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
    );
  }
}
