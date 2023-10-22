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
    return ListView.builder(
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
