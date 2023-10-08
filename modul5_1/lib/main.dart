import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul5_1/widgets/datetime.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
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
  DateTime nowDay = DateTime.now();

  void addDateMonth() {
    if (nowDay.month == DateTime.now().month) {
      setState(() {
        nowDay = DateTime.now();
      });
    } else {
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month + 1, nowDay.day);
      });
    }
  }
// 
  void minusDateMonth() {
    if (nowDay.year == 2020 && nowDay.month == 1) {
      setState(() {
        nowDay = DateTime.now();
      });
    } else {
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month - 1, nowDay.day);
      });
    }
  }

  void showKalendar(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          nowDay = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        appBar: AppBar(title: Text("My wallet")),
        body: Column(
          children: [
            HIGH(showKalendar, addDateMonth, minusDateMonth, nowDay),
            SizedBox(height: 20,),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 444,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(239, 240, 250, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)
                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)
                      )
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
