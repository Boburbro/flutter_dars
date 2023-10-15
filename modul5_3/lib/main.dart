import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul5_3/models/expense.dart';
import 'package:modul5_3/widgets/add_expense.dart';
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
  Expenses items = Expenses();
  DateTime nowDay = DateTime.now();
  // double budgetLimit = 10000000;


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

  void openModalScreen(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        // isScrollControlled: true,a
        context: context,
        builder: (ctx) {
          return ADDEXPENSE(addNewExpense);
        });
  }

  void addNewExpense(String title, DateTime date, double amount){
    setState(() {
      items.addNewExpenses(title, date, amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(items.totalItems(nowDay));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My wallet"),
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(Icons.add))
        // ],
      ),
      body: Column(
        children: [
          HIGH(nowDay, openKalendar, nextMonth, formerMonth, items.totalItems(nowDay)),
          const SizedBox(
            height: 10,
          ),
          BODY(items.itemsByMonth(nowDay), items.totalItems(nowDay))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModalScreen(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
