import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HIGH extends StatelessWidget {
  final DateTime nowDay;
  final Function openKalendar, nextMonth, formerMonth;

  HIGH(this.nowDay, this.openKalendar, this.nextMonth, this.formerMonth);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                openKalendar(context);
              },
              child: Text("${DateFormat('MMMM, yyy').format(nowDay)}")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: nowDay.year == DateTime.now().year - 1 ? Colors.grey : Colors.black,
                  ),
                ),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: nowDay.year == DateTime.now().year - 1
                      ? null
                      : () {
                          formerMonth();
                        },
                  icon: Icon(
                    Icons.arrow_left,
                    size: 30,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "450,000",
                    style: TextStyle(fontSize: 35),
                  ),
                  Text("so'm", style: TextStyle(height: 0.6),),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: DateTime.now().month == nowDay.month &&
                                DateTime.now().year == nowDay.year
                            ? Colors.grey
                            : Colors.black),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: DateTime.now().month == nowDay.month &&
                          DateTime.now().year == nowDay.year
                      ? null
                      : () {
                          nextMonth();
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
