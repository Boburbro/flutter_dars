import 'package:flutter/material.dart';
import 'package:modul2_homework_1/widgets/home.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: HOME(),
        ),

        floatingActionButton:FloatingActionButton(child: Icon(Icons.add), onPressed: () {},tooltip: "add",),
      ),
      
    );
  }
}