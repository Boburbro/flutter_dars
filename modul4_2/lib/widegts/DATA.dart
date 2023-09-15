import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DATA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left, size: 35),),
              TextButton(
                onPressed: () {}, 
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 20, 
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Friday, ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      TextSpan(
                        
                        text: "6 Aug"
                      )
                    ]
                  )
                  ) 
                ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right, size: 35,),),

            ],
          );
  }
}