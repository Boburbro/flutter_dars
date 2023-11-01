import 'package:flutter/material.dart';
import 'package:modul7_1/models/category.dart';
import 'package:modul7_1/widget/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;

  CategoriesScreen(this.categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ovqatlar menusi"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          category_item(),
          category_item(),
          category_item(),

          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
          category_item(),
        ],
      ),
    );
  }
}
