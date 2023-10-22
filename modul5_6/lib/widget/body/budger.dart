import 'package:flutter/material.dart';
import 'package:modul5_6/widget/modalBottoms/changeLimit.dart';

class BUDGET extends StatelessWidget {
  final double budgetLimit;
  final double totleExpens;
  final Function changeLimit;

  BUDGET(this.budgetLimit, this.totleExpens, this.changeLimit);

  double nn(m) {
    if (m < 1.0) {
      return m;
    } else {
      return 1.0;
    }
  }

  void openChangeScreen(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
        context: context,
        builder: (ctx) {
          return CHANGELIMIT(changeLimit, budgetLimit);
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
                Text("Oylik budget: "),
                TextButton.icon(
                    onPressed: () {
                      openChangeScreen(context);
                    },
                    icon: Icon(Icons.edit),
                    label: Text("${budgetLimit.toStringAsFixed(0)} so'm")),
              ],
            ),
            Text(
                "${((totleExpens * 100) / budgetLimit < 100 ? ((totleExpens * 100) / budgetLimit) : 100).toStringAsFixed(1)}%")
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(212, 219, 239, 1)),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: nn(((totleExpens * 100) / budgetLimit) / 100),
                  heightFactor: 2,
                  child: Container(
                    width: 10,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.blue,
                          Colors.blue,
                          Colors.blue.shade200,
                          Colors.blue
                        ]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 10,
                              spreadRadius: 2)
                        ]),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
