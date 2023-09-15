import 'package:flutter/material.dart';
import 'package:modul4_4/widgets/data.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp()); 
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            ],
          ),
        ),
      ),
    );
  }
}