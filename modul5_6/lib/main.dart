import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul5_6/models/expense.dart';
import 'package:modul5_6/widget/body/body.dart';
import 'package:modul5_6/widget/high/high.dart';
import 'package:modul5_6/widget/modalBottoms/addNewExpense.dart';

void main(List<String> args) {
  // WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp

  // ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
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
  Expenses items = Expenses();
  double budgetLimit = 10000000;
  DateTime nowDay = DateTime.now();
  bool _showLend = false;

  void openKalendar(BuildContext context) {
    showMonthPicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        setState(() {
          nowDay = value;
        });
      }
    });
  }

  void nextMonth() {
    if (nowDay.month == DateTime.now().month &&
        nowDay.year == DateTime.now().year) {
      return;
    } else {
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month + 1, nowDay.day);
      });
    }
  }

  void formerMonth() {
    if (nowDay.year == DateTime.now().year - 1) {
      return;
    } else {
      setState(() {
        nowDay = DateTime(nowDay.year, nowDay.month - 1, nowDay.day);
      });
    }
  }

  void addNewExpense(BuildContext context) {
    void addNewExpensesWidget(
      String title,
      DateTime date,
      double amount,
      IconData icon,
    ) {
      setState(() {
        items.addNewExpenses(title, date, amount, icon);
      });
    }

    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return ADDNEWEXPENSE(addNewExpensesWidget);
        });
  }

  void changeLimit(double newLimit) {
    setState(() {
      budgetLimit = newLimit;
    });
  }

  void removeItems(String rID) {
    setState(() {
      items.removeItem(rID);
    });
  }

  Widget _showPortretItems(deviceHigh, deviceWidth) {
    return Column(
      children: [
        Container(
          width: deviceWidth,
          height: deviceHigh * 0.2,
          child: HIGH(openKalendar, nowDay, nextMonth, formerMonth,
              items.totalItems(nowDay)),
        ),
        Container(
          width: deviceWidth,
          height: deviceHigh * 0.8,
          child: BODY(items.itemsByMonth(nowDay), items.totalItems(nowDay),
              budgetLimit, changeLimit, removeItems),
        ),
      ],
    );
  }

  Widget _showLendscapeItems(deviceHigh, deviceWidth) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ro'yxatni ko'rsatish"),
            Switch.adaptive(
              value: _showLend,
              onChanged: (expression) {
                setState(
                  () {
                    _showLend = expression;
                  },
                );
              },
            )
          ],
        ),
        _showLend
            ? Container(
                height: deviceHigh * 0.9,
                width: deviceWidth,
                child: BODY(
                    items.itemsByMonth(nowDay),
                    items.totalItems(nowDay),
                    budgetLimit,
                    changeLimit,
                    removeItems),
              )
            : Container(
                height: deviceHigh * 0.9,
                width: deviceWidth,
                child: HIGH(openKalendar, nowDay, nextMonth, formerMonth,
                    items.totalItems(nowDay)),
              )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("My Wallet"),
      centerTitle: true,
      actions: Platform.isIOS
          ? [
              IconButton(
                onPressed: () {addNewExpense(context);},
                icon: Icon(Icons.add),
              ),
            ]
          : [],
    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final deviceHigh = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            isLandscape
                ? _showLendscapeItems(deviceHigh, deviceWidth)
                : _showPortretItems(deviceHigh, deviceWidth)
          ],
        ),
      ),
      floatingActionButton: Platform.isAndroid
          ? FloatingActionButton(
              onPressed: () {
                addNewExpense(context);
              },
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
