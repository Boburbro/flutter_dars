import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DATA extends StatelessWidget {
  final Function getDataByKalendar, oldingiSana, keyingiSana;
  final DateTime beliganganKun;

  DATA(this.getDataByKalendar, this.beliganganKun,this.oldingiSana, this.keyingiSana);


  @override
  Widget build(BuildContext context) {

    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: ()=> oldingiSana(), icon: Icon(Icons.arrow_left, size: 35,)),
                  TextButton(
                    onPressed: ()=> getDataByKalendar(context), 
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                        children: [
                         TextSpan(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                           text: "${DateFormat.EEEE().format(beliganganKun)}, "
                             ),
                          TextSpan(
                            text: DateFormat("d MMM").format(beliganganKun)
                          )
                           ]
                          )
                       )
                     ),
                  IconButton(onPressed: ()=> keyingiSana(), icon: Icon(Icons.arrow_right, size: 35,)),
                ],
              );
  }
}