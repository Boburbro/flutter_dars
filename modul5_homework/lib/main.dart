import 'package:flutter/material.dart';
import 'package:modul5_homework/screens/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HOMEPAGE(),
    );
  }
}
