import 'package:flutter/material.dart';

class MONTH extends StatelessWidget {
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    size: 16,
                  ),
                  label: Text("1,000,000so'm"),
                ),
              ],
            ),
            Text("12%")
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
            widthFactor: 0.5,
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
