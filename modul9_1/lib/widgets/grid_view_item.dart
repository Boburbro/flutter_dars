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
  var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Products>(context, listen: false).getProducts().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    final list =
        widget.showFavoriteItems ? productsData.favorite : productsData.items;
    return _isLoading
        ? const Center(
            child: CupertinoActivityIndicator(
              radius: 30,
              color: CupertinoColors.activeBlue,
            ),
          )
        : list.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                })
            : const Center(child: Text("Maxsulot yo'q"));
  }
}
