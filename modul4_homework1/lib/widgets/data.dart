import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DATA extends StatelessWidget {
  final DateTime nowDay;
  final Function nextMonth, previousMonth, showKalendar, chack;

  DATA(this.nowDay, this.nextMonth, this.previousMonth, this.showKalendar, this.chack);
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Center(
            child: TextButton(onPressed: (){showKalendar(context);}, child: Text("${DateFormat('MMMM, yyy').format(nowDay)}", style: TextStyle(fontSize: 20),))
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){previousMonth();}, icon: Icon(Icons.arrow_circle_left_outlined)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${chack(nowDay)}", style: TextStyle(fontSize: 40),),
                  Text("so'm")
                ],
              ),
              IconButton(onPressed: (){nextMonth();}, icon: Icon(Icons.arrow_circle_right_outlined)),
            ],
          ),
      ],
    );
  }
}