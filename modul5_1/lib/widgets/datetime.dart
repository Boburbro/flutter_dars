import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HIGH extends StatelessWidget {
  final Function showKalendar, addDateMonth, minusDateMonth;
  final DateTime nowDay;

  HIGH(this.showKalendar, this.addDateMonth, this.minusDateMonth, this.nowDay);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showKalendar(context);
              },
              child: Text("${DateFormat('MMMM, yyy').format(nowDay)}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      minusDateMonth();
                    },
                    icon: Icon(
                      Icons.arrow_left,
                      size: 30,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "450,000",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "so'm",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        height: 0.6,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      addDateMonth();
                    },
                    icon: Icon(
                      Icons.arrow_right,
                      size: 30,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
  }
}