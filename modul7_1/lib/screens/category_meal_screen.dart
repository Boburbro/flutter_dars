import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String appTitle;
  // const CategoryMealScreen(this.appTitle, {super.key});

  @override
  Widget build(BuildContext context) {

    final categoryTitle = ModalRoute.of(context)!.settings.arguments as String;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$categoryTitle"),),
      body: Center(child: Text('d')),
    );
  }
}