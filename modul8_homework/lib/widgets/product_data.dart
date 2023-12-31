import 'package:flutter/material.dart';
import 'package:modul8_homework/model/product.dart';
import 'package:modul8_homework/providers/cart_item_provider.dart';
import 'package:provider/provider.dart';

class ProductData extends StatelessWidget {
  const ProductData({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartItemProvider>(context, listen: false);
    return InkWell(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridTile(
            footer: GridTileBar(
              leading: IconButton(
                onPressed: () {
                  product.changeFavorite();
                },
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
                onPressed: () {
                  cart.addNewCartItem(
                      product.id, product.title, product.imgUrl, product.price);
                },
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
