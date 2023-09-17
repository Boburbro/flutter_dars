import 'package:flutter/material.dart';
import 'package:modul4_4/widgets/ToDO.dart';
import 'package:modul4_4/widgets/data.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:modul4_4/widgets/todolist.dart';

void main(){
  runApp(MyApp()); 
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ToDo"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              DATA(),
              TODO(),
              todoList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      ),
    );
  }
}