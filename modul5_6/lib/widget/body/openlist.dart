import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modul5_6/models/expense.dart';
import 'package:modul5_6/widget/body/itemListBuid.dart';

class OPENLIST extends StatelessWidget {
  final List<Expense> items;
  final Function removeItem;

  OPENLIST(this.items, this.removeItem);

  @override
  Widget build(BuildContext context) {
    return items.length == 0
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Siz daxosiz sizda shiqim yo'q!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/profit.png",
                  width: 250,
                  fit: BoxFit.contain,
                ),
              )
            ],
          )
        : ListView.builder(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) {
              return ITEMLISTBUILD(
                  items[index].id,
                  "${items[index].title}",
                  DateFormat('d MMMM, yyyy').format(items[index].date),
                  "${items[index].amount}",
                  items[index].icon,
                  removeItem,
                  ValueKey(items[index].id));
            },
            itemCount: items.length,
          );
  }
}
