import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("03", style: TextStyle(fontWeight: FontWeight.w600),),
              Text("Barcha rejalaringiz", style: TextStyle(fontSize: 12, color: Colors.black54))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("00", style: TextStyle(fontWeight: FontWeight.w600)),
              Text("Bajarilgan rejalaringiz", style: TextStyle(fontSize: 12, color: Colors.black54))
            ],
          )
          
        ],
      ),
    );
  }
}