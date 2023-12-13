import 'package:flutter/material.dart';
import 'package:modul8_homework/model/product.dart';
import 'package:provider/provider.dart';

class ProductData extends StatelessWidget {
  const ProductData({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return InkWell(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridTile(
            footer: GridTileBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  product.isFavorited
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              backgroundColor: Colors.black87,
            ),
            child: Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
