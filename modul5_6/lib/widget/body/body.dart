import 'package:flutter/material.dart';
import 'package:modul5_6/models/expense.dart';
import 'package:modul5_6/widget/body/budger.dart';
import 'package:modul5_6/widget/body/openlist.dart';

class BODY extends StatelessWidget {
  final List<Expense> items;
  final double totalItem, budgetLimit;
  final Function changeLimit, removeItem;

  BODY(this.items, this.totalItem, this.budgetLimit, this.changeLimit,
      this.removeItem);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          print(constraints);
          return Container(
            width: double.infinity,
            height: constraints.maxHeight,
            padding: EdgeInsets.only(
              top: 10,
              right: 24,
              left: 24,
              bottom: 10,
            ),
            child: BUDGET(budgetLimit, totalItem, changeLimit),
            decoration: BoxDecoration(
                color: Color.fromRGBO(239, 240, 250, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
          );
        }),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              margin: EdgeInsets.only(top: 104),
                clipBehavior: Clip.hardEdge,
                height: constraints.maxHeight - 104,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                    color: Colors.white),
                child: OPENLIST(items, removeItem),
              );
          }
        )
      ],
    );
  }
}
