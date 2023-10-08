import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HIGH extends StatelessWidget {
  final DateTime nowDay;
  final Function openKalendar, addMonthToNowDay, minusMonthToNowDay;

  HIGH(this.nowDay, this.openKalendar, this.addMonthToNowDay,
      this.minusMonthToNowDay);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                openKalendar(context);
              },
              child: Text("${DateFormat('MMMM, yyyy').format(nowDay)}")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    minusMonthToNowDay();
                  },
                  icon: Icon(Icons.arrow_left),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "450,000",
                    style: TextStyle(fontSize: 35),
                  ),
                  Text(
                    "so'm",
                    style: TextStyle(height: 0.6),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: IconButton(onPressed: (){addMonthToNowDay();}, icon: Icon(Icons.arrow_right),)),
            ],
          ),
        ],
      ),
    );
  }
}
