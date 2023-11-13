import 'package:flutter/material.dart';
import 'package:modul7_2/model/category.dart';
import 'package:modul7_2/screens/home/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _items = Categories();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Home(_items.item),
    );
  }
}
