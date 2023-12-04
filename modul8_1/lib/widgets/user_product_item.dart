import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(product.imgUrl)),
        title: Text(product.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mode_edit_outline_rounded,
                  color: Theme.of(context).primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_forever_rounded,
                  color: Theme.of(context).errorColor,
                )),
          ],
        ),
      ),
    );
  }
}
