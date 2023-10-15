import 'package:flutter/material.dart';
import 'package:modul5_5/widgets/edit_monthly_budget.dart';

// ignore: must_be_immutable
class MONTH extends StatefulWidget {
  final double totleExpens;
  double budgetLimit = 10000000;

  MONTH(this.totleExpens);

  @override
  State<MONTH> createState() => _MONTHState();
}

class _MONTHState extends State<MONTH> {
  double nn(m) {
    if (m < 1.0) {
      return m;
    } else {
      return 1.0;
    }
  }

  void showMonthlyBudgetScreen(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return EDITMONTHLYBUDGET(changeLimit, widget.budgetLimit);
        },
        isDismissible: false);
  }

  void changeLimit(double newLimit) {
    setState(() {
      widget.budgetLimit = newLimit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Oylik buyjet:"),
                TextButton.icon(
                  onPressed: () {
                    showMonthlyBudgetScreen(context);
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 16,
                  ),
                  label: Text("${widget.budgetLimit} so'm"),
                ),
              ],
            ),
            Text(
                "${((widget.totleExpens * 100) / widget.budgetLimit < 100 ? ((widget.totleExpens * 100) / widget.budgetLimit) : 100).toStringAsFixed(1)}%")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: Color.fromRGBO(212, 219, 239, 1),
              borderRadius: BorderRadius.circular(10)),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: nn(((widget.totleExpens * 100) / widget.budgetLimit) /
                100), // (totleExpens*100)/1000000 = 50 -> 5, 0.5
            heightFactor: 2,
            child: Container(
              width: 10,
              height: 20,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue,
                    Colors.blue.shade200,
                    Colors.blue,
                  ]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue, blurRadius: 10, spreadRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        )
      ],
    );
  }
}
