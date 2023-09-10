import 'package:flutter/material.dart';
import 'package:modul2_5/widgets/home.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.amber,
          body: HOME(),
        ),
      ),
    );
  }
}