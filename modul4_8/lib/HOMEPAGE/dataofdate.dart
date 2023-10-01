import 'package:flutter/material.dart';

class DATAOFDATE extends StatelessWidget {
  final int uzunlik, uzunlik2;

  DATAOFDATE(this.uzunlik, this.uzunlik2);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              uzunlik > 9 ? Text("$uzunlik", style: TextStyle(fontWeight: FontWeight.w600),) : Text("0$uzunlik", style: TextStyle(fontWeight: FontWeight.w600)),
              Text("Rejalar soni", style: TextStyle(fontSize: 12, color: Colors.black54),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              uzunlik > 9 ? Text("$uzunlik2", style: TextStyle(fontWeight: FontWeight.w600)) : Text("0$uzunlik2", style: TextStyle(fontWeight: FontWeight.w600)),
              Text("Bajarilingan rejalar soni", style: TextStyle(fontSize: 12, color: Colors.black54))
            ],
          )
        ],
      ),
    );
  }
}