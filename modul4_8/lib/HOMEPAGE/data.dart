import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DATA extends StatelessWidget {
  final DateTime nowDay;
  final Function openKalendar, addOneDay, minusOneDay;

  DATA(this.nowDay,this.openKalendar, this.addOneDay, this.minusOneDay);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){minusOneDay();}, icon: Icon(Icons.arrow_left, size: 35,)),
        TextButton(
          onPressed: (){openKalendar(context);},
          child: RichText(text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 20
        
            ),
            children: [
              TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                text: "${DateFormat.EEEE().format(nowDay)}, ",
              ),
              TextSpan(
                text: DateFormat("d MMM").format(nowDay)
              )
            ]
          ),),
        ),
        IconButton(onPressed: (){addOneDay();}, icon: Icon(Icons.arrow_right, size: 35,)),
      ],
    );
  }
}