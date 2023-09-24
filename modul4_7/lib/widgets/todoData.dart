import 'package:flutter/material.dart';

class TODODATA extends StatelessWidget {
  final int rejalarSoni, bajarilinganRejalar;

  TODODATA(this.rejalarSoni, this.bajarilinganRejalar);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rejalarSoni < 10 ? "0$rejalarSoni" : "$rejalarSoni" , 
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                "Barcha rejalar", style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54
                ),
                )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                bajarilinganRejalar < 10 ? "0$bajarilinganRejalar" : "$bajarilinganRejalar", style: TextStyle(fontWeight: FontWeight.w600)
                ),
              Text(
                "Bajarilingan rejalar",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54
                )
                )
            ],
          )
        ],
      ),
    );
  }
}