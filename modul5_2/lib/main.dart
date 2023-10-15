
import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:modul5_2/widgets/body.dart';
import 'package:modul5_2/widgets/high.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HOMEPAGE(),
    );
  }
}

class HOMEPAGE extends StatefulWidget {
  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}


class _HOMEPAGEState extends State<HOMEPAGE> {

  DateTime nowDay = DateTime.now();

  void openKalendar(BuildContext context){
    showMonthPicker(context: context, 
    initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now(),).then((value){
      if (value != null){
        setState(() {
          nowDay = value;
        });
      }
    });
  }

  void addMonthToNowDay(){
    if (nowDay.year == DateTime.now().year){
      setState(() {
        nowDay = DateTime.now();
      });
    }
    else{
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month + 1, nowDay.day);
      });
    }
  }

  void minusMonthToNowDay(){
    if (nowDay == DateTime(2020)){
      setState(() {
        nowDay = DateTime.now();
      });
    }
    else{
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month - 1, nowDay.day);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My wallet"),),
      body: Column(
        children: [
          SizedBox(height: 20,),
          HIGH(nowDay, openKalendar, addMonthToNowDay, minusMonthToNowDay),
          SizedBox(height: 30,),
          Expanded(child: BODY()),

          


        ],
      ),
    );
  }
}