import 'package:flutter/material.dart';
import 'package:modul2_7/widgets/home.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "StyleScript",),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: HOME(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.search),
          ),
        ),
      );
  }
}