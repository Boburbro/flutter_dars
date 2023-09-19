
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul4_6/models/reja_modeli.dart';
import 'package:modul4_6/widgets/data.dart';
import 'package:modul4_6/widgets/todo.dart';
import 'package:modul4_6/widgets/todolist.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  List<RejaModeli> rejalar = Rejalar().ruyxat;



  DateTime beliganganKun = DateTime.now();




  void oldingiSana(){
    setState(() {
      beliganganKun = DateTime(beliganganKun.year, beliganganKun.month, beliganganKun.day-1);
    });
  }

  void keyingiSana(){
    setState(() {
      beliganganKun = DateTime(beliganganKun.year, beliganganKun.month, beliganganKun.day+1);
    });
  }

  void getDataByKalendar(BuildContext context){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
    ).then((tanlanganKun){
      if (tanlanganKun != null){
        setState(() {
        beliganganKun = tanlanganKun;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(rejalar);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ToDo"),
          centerTitle: true,
          ),
        body: SafeArea(
          child: Column(
            children: [
              DATA(getDataByKalendar, beliganganKun, oldingiSana, keyingiSana),
              TODO(),
              TODOLIST(rejalar),
             ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      ),
    );
  }
}