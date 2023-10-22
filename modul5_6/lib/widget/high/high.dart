import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HIGH extends StatelessWidget {
  final Function openKalendar;
  final DateTime nowDay;
  final Function nextMonth;
  final Function formerMonth;
  final double totalItems;

  HIGH(this.openKalendar, this.nowDay, this.nextMonth, this.formerMonth, this.totalItems);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextButton(
            onPressed: () {openKalendar(context);},
            child: Text("${DateFormat('MMMM, yyyy').format(nowDay)}", style: TextStyle(fontSize: 17)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: nowDay.year == DateTime.now().year - 1 ?  Colors.grey : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: IconButton(padding: EdgeInsets.zero, onPressed: () {formerMonth();}, icon: Icon(Icons.arrow_left, size: 30,color: nowDay.year == DateTime.now().year - 1 ?  Colors.grey : Colors.black,)),
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    totalItems.toStringAsFixed(0),
                    style: TextStyle(fontSize: 45),
                  ),
                  Text(
                    "so'm",
                    style: TextStyle(height: 0.6),
                  )
                ],
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 1,
                      color: nowDay.month == DateTime.now().month &&
        nowDay.year == DateTime.now().year ? Colors.grey : Colors.black,
                    )),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {nextMonth();},
                  icon: Icon(
                    Icons.arrow_right,
                    size: 30,
                    color: nowDay.month == DateTime.now().month &&
        nowDay.year == DateTime.now().year ? Colors.grey : Colors.black,
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
