import 'package:flutter/material.dart';
import 'package:modul4_2/widegts/DATA.dart';

class HOME extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDo"),
      ),
      body: Column(
        children: [
          DATA(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('03', style: TextStyle(fontWeight: FontWeight.w600),),
                    Text("Barcha rejalaringiz", style: TextStyle(fontSize: 12, color: Colors.black54),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('00', style: TextStyle(fontWeight: FontWeight.w600),),
                    Text("Bajarilgan rejalaringiz", style: TextStyle(fontSize: 12, color: Colors.black54),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}