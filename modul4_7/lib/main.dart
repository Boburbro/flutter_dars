
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul4_7/models/reja_modeli.dart';
import 'package:modul4_7/widgets/data.dart';
import 'package:modul4_7/widgets/todoData.dart';
import 'package:modul4_7/widgets/todoList.dart';

void  main(){
  return runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List <RejaModeli> rejalar = Rejalar().ruyxat;
  DateTime berilganKun = DateTime.now();

  void getDataByKalendat(BuildContext context){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
      ).then((tanlanganKun){
        if(tanlanganKun != null){
          setState(() {
          berilganKun = tanlanganKun;    
          });
        }
      });
  }

  void kunQoshish(){
    setState(() {
      berilganKun = DateTime(berilganKun.year, berilganKun.month, berilganKun.day+1);
    });
  }
  void kunAyirish(){
    setState(() {
      berilganKun = DateTime(berilganKun.year, berilganKun.month, berilganKun.day+1);
    });
  }
  void belgilash(String rid){
    setState(() {
      rejalar.firstWhere((reja) => reja.id == rid).changeIsDone();
    });
  }
  void deleteToDo(rid){
    setState(() {
      rejalar.removeWhere((reja) => reja.id == rid);
    });
  }
  void openAddToDoScreen(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (ctx){
        return Container(
          child: Column(
            children: [
              Text("data")
            ],
          ),
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily ,
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
              
              DATA(
                getDataByKalendat, 
                berilganKun,
                kunQoshish,
                kunAyirish,
                ),
              TODODATA(
                rejalar.length,
                rejalar.where((reja) => reja.isDone).length
                ),
              TODOLIST(rejalar, belgilash, deleteToDo),
            ],
            
          ),


          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              openAddToDoScreen(context);
            },
          ),
      ),
    );
  }
}