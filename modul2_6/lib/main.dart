import 'package:flutter/material.dart';
import 'package:modul2_6/widgets/home.dart';

void main(){
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
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.search),
          ),
        ),
      );
  }
}