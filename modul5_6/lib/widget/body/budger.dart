import 'package:flutter/material.dart';

class BUDGET extends StatelessWidget {
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
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text("1,000,000 so'm")),
              ],
            ),
            Text("25.5%")
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
                  widthFactor: 0.5,
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
