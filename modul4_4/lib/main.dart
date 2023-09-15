import 'package:flutter/material.dart';
import 'package:modul4_4/widgets/ToDO.dart';
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
              TODO(),
              Expanded(
                child: ListView.builder(itemBuilder: (ctx, index){
                  return ListTile(
                    leading: IconButton(icon: Icon(Icons.circle_outlined), onPressed: (){},),
                    title: Text("ToDo", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                    trailing: IconButton(icon: Icon(Icons.delete_forever_rounded, size: 20,), onPressed: (){},),
                  );
                },
                itemCount: 5,),
              )
            ],
          ),
        ),
      ),
    );
  }
}