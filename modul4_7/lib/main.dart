
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul4_7/models/reja_modeli.dart';
import 'package:modul4_7/widgets/newToDO.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily ,
      ),
      debugShowCheckedModeBanner: false,
      home: HOMEPAGE(),
    );
  }
}

class HOMEPAGE extends StatefulWidget {

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {

  Rejalar rejalar = Rejalar();
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
      berilganKun = DateTime(berilganKun.year, berilganKun.month, berilganKun.day-1);
    });
  }
  void belgilash(String rid){
    setState(() {
      rejalar.todoByDay(berilganKun).firstWhere((reja) => reja.id == rid).changeIsDone();
    });
  }
  void deleteToDo(rid){
    setState(() {
      rejalar.ruyxat.removeWhere((reja) => reja.id == rid);
    });
  }
  void openAddToDoScreen(BuildContext context, Function addNewToDo){
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context, 
      builder: (ctx){
        return NEWTODO(addNewToDo);
      }
    );
  }
  void addNewToDo(String rejanomi, DateTime rejakuni){
    setState(() {
      rejalar.addToDO(rejanomi, rejakuni);
    });
    Navigator.of(context).pop();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                rejalar.todoByDay(berilganKun).length,
                rejalar.todoByDay(berilganKun).where((reja) => reja.isDone).length
                ),
              TODOLIST(rejalar.todoByDay(berilganKun), belgilash, deleteToDo),
            ],
            
          ),


          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              openAddToDoScreen(context, addNewToDo);
            },
          ),
      );
  }
}
