import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul5_3/widgets/body.dart';
import 'package:modul5_3/widgets/high.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  DateTime nowDay = DateTime.now();

  void openKalendar(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          nowDay = value;
        });
      }
    });
  }

  void nextMonth() {
    if (DateTime.now().month == nowDay.month &&
        DateTime.now().year == nowDay.year) {
      setState(() {
        nowDay = DateTime.now();
      });
    } else {
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month + 1, nowDay.day);
      });
    }
  }

  void formerMonth() {
    if (nowDay.year == DateTime.now().year - 1) {
      setState(() {
        nowDay = DateTime.now();
      });
    } else {
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month - 1, nowDay.day);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My wallet"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          HIGH(nowDay, openKalendar, nextMonth, formerMonth),
          SizedBox(height: 50,),
          BODY()
        ],
      ),
    );
  }
}
