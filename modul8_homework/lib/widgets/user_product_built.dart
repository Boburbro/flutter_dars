import 'package:flutter/material.dart';
import 'package:modul8_homework/model/product.dart';
import 'package:modul8_homework/providers/product_provider.dart';
import 'package:modul8_homework/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductBuild extends StatelessWidget {
  const UserProductBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            product.imgUrl,
          ),
        ),
        title: Text(product.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: product.id),
              icon: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Bekor qilish"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .deleteById(product.id);
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).errorColor,
                          ),
                          child: const Text("Ha!"),
                        )
                      ],
                      title: const Text("Ishonchingiz komilmi?"),
                      content: const Text("Bu element o'chmoqda"),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
