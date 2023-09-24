import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DATA extends StatelessWidget {
  final DateTime berilganKun;
  final Function getDataByKalendat, kunQoshish, kunAyirish;

  DATA(this.getDataByKalendat, this.berilganKun, this.kunQoshish, this.kunAyirish);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: ()=>kunAyirish(), icon: Icon(Icons.arrow_left, size: 35)),
        TextButton(
          onPressed: ()=> getDataByKalendat(context),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: Colors.black,
                fontSize: 20
              ),
              children: [
                TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  text: "${DateFormat.EEEE().format(berilganKun)}, "
                ),
                TextSpan(
                  text: DateFormat('d MMM').format(berilganKun)
                )

              ]
            ) 
            ),
        ),
        IconButton(onPressed: ()=>kunQoshish(), icon: Icon(Icons.arrow_right, size: 35)),
      ],
    );
  }
}