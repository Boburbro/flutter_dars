import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/products.dart';
import 'product_item.dart';

class GridViewItem extends StatefulWidget {
  const GridViewItem({
    super.key,
    required this.showFavoriteItems,
  });

  final bool showFavoriteItems;

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  late Future _getData;
  Future _setData() {
    return _getData =
        Provider.of<Products>(context, listen: false).getProducts();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData,
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
            return Consumer<Products>(
              builder: (context, products, child) {
                final list = widget.showFavoriteItems
                    ? products.favorite
                    : products.items;
                return list.isNotEmpty
                    ? GridView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: list.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3 / 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (ctx, i) {
                          return ChangeNotifierProvider<Product>.value(
                            value: list[i],
                            child: const ProductItem(),
                          );
                        },
                      )
                    : const Center(child: Text("Maxsulot yo'q"));
              },
            );
          } else {
            return const Center(child: Text("Xatolik!"));
          }
        }
      },
    );
  }
}
