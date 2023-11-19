import 'package:flutter/material.dart';
import 'package:modul8_1/models/product.dart';
import 'package:modul8_1/screens/product_detals.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetals.routeName, arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          footer: GridTileBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ),
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          child: Image.network(
            product.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
