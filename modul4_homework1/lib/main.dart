import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul4_homework1/models/hamyon.dart';
import 'package:modul4_homework1/widgets/addNewChack.dart';
import 'package:modul4_homework1/widgets/budget.dart';
import 'package:modul4_homework1/widgets/changeLimit.dart';
import 'package:modul4_homework1/widgets/data.dart';
import 'package:modul4_homework1/widgets/dataList.dart';

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
  XisobLimit limitList = XisobLimit();
  Xisob pullar = Xisob();
  DateTime nowDay = DateTime.now();

  void nextMonth() {
    setState(() {
      nowDay = DateTime(nowDay.year, nowDay.month + 1, nowDay.day);
    });
  }

  void previousMonth() {
    setState(() {
      nowDay = DateTime(nowDay.year, nowDay.month - 1, nowDay.day);
    });
  }

  void showKalendar(BuildContext context) {
    showMonthPicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2100))
        .then((tanlangan) {
      if (tanlangan != null) {
        setState(() {
          nowDay = tanlangan;
        });
      }
    });
  }

  void changLimit1(int _limit) {
    setState(() {
      limitList
          .getLimit()
          .firstWhere((element) => element.rId == 1)
          .changLimit(_limit);
    });
  }

  void deleteXisob(String rId){
    setState(() {
      pullar.ruyxat.removeWhere((element) => element.rId == rId);  
      print(pullar.ruyxat.length);
    });
  }

  void getDataForAdd(String nomi, int summa, DateTime vaqti){
    setState(() {
      pullar.addNewRuyxat(nomi, summa, vaqti);
    });
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return ADDNEWCHACK(getDataForAdd: getDataForAdd);
      },
    );
  }

  void changLimitScreen(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return ChANGELIMIT(changLimit1);
      },
    );
  }
  
  int chack(DateTime month1){
    List<int> a = [];
    int n = 0;

    List v = pullar.allManeyByMonth(month1);

    for (var vv in v) {
      a.add(vv.summa);
    }

    for (var aa in a) {
      n += aa;
    }

    return n;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Wallet"),
      ),
      body: Column(
        children: [
          DATA(nowDay, nextMonth, previousMonth, showKalendar, chack),
          BUDGET(limitList.getLimit(), changLimit1, chack, nowDay, changLimitScreen),
          DATALIST(pullar.allManeyByMonth(nowDay), nowDay, deleteXisob),
        ],
      ),
    );
  }
}
