import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul4_8/HOMEPAGE/data.dart';
import 'package:modul4_8/HOMEPAGE/dataofdate.dart';
import 'package:modul4_8/HOMEPAGE/newtodo.dart';
import 'package:modul4_8/HOMEPAGE/todolist.dart';
import 'package:modul4_8/models/reja_modeli.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: HOMEPAGE(),
    );
  }
}

class HOMEPAGE extends StatefulWidget {
  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {
  Rejalar ruyxat = Rejalar();
  DateTime nowDay = DateTime.now();

  void openKalendar(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100))
        .then((tanlangan) {
      if (tanlangan != null) {
        setState(() {
          nowDay = tanlangan;
        });
      }
    });
  }

  void addOneDay() {
    setState(() {
      nowDay = DateTime(nowDay.year, nowDay.month, nowDay.day + 1);
    });
  }

  void minusOneDay() {
    setState(() {
      nowDay = DateTime(nowDay.year, nowDay.month, nowDay.day - 1);
    });
  }

  void changeIsDoneById(rId) {
    setState(() {
      ruyxat
          .todoByDay(nowDay)
          .firstWhere((todo) => todo.rID == rId)
          .changeIsDone();
    });
  }

  void openModalScreen(BuildContext context, Function addNewToDo) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return NEWTODO(addNewToDo);
        });
  }

  void deleteToDo(rId) {
    setState(() {
      ruyxat.ruyxat.removeWhere((todo) => todo.rID == rId);
    });
  }

  void addNewToDo(String nomiT, DateTime vaqtiT) {
    setState(() {
      ruyxat.addToDoAsNew(nomiT, vaqtiT);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo app"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DATA(nowDay, openKalendar, addOneDay, minusOneDay),
          DATAOFDATE(ruyxat.todoByDay(nowDay).length,
              ruyxat.todoByDay(nowDay).where((todo) => todo.isDone).length),
          TODOLIST(ruyxat.todoByDay(nowDay), changeIsDoneById, deleteToDo),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModalScreen(context, addNewToDo);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
