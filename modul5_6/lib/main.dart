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
        String title, DateTime date, double amount, IconData icon) {
      setState(() {
        items.addNewExpenses(title, date, amount, icon);
      });
    }

    showModalBottomSheet(
        isDismissible: false,
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

  Widget _showPortretItems() {
    return Column(
      children: [
        HIGH(openKalendar, nowDay, nextMonth, formerMonth,
            items.totalItems(nowDay)),
        SizedBox(
          height: 10,
        ),
        BODY(items.itemsByMonth(nowDay), items.totalItems(nowDay), budgetLimit,
            changeLimit, removeItems)
      ],
    );
  }

  Widget _showLendscape() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ro'yxatni ko'rsatish"),
            Switch(
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
            ? BODY(items.itemsByMonth(nowDay), items.totalItems(nowDay),
                budgetLimit, changeLimit, removeItems)
            : HIGH(openKalendar, nowDay, nextMonth, formerMonth,
                items.totalItems(nowDay))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Wallet"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [isLandscape ? _showLendscape() : _showPortretItems()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewExpense(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
