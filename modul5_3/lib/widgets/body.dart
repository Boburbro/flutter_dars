import 'package:flutter/material.dart';
import 'package:modul5_3/models/expense.dart';
import 'package:modul5_3/widgets/itemLists.dart';
import 'package:modul5_3/widgets/month.dart';

// ignore: must_be_immutable
class BODY extends StatelessWidget {
  final List<Expense> items;
  final double totleExpens;

  BODY(this.items, this.totleExpens);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              right: 30,
              left: 30,
              bottom: 10
            ),
            child: MONTH(totleExpens),
            decoration: BoxDecoration(
                color: Color.fromRGBO(239, 240, 250, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
          ),
          Positioned(
            bottom: 0,
            child: ITEMLISTS(items),
          )
        ],
      ),
    );
  }
}
