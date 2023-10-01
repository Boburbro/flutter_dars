import 'package:flutter/material.dart';
import 'package:modul4_homework1/models/hamyon.dart';
import 'package:modul4_homework1/widgets/listView.dart';

class DATALIST extends StatelessWidget {
  final List<Hamyon> ruyxat;
  final DateTime nowDay;
  final Function deleteXisob;

  DATALIST(this.ruyxat, this.nowDay, this.deleteXisob);
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ruyxat.length > 0 ? ListView.builder(
        itemBuilder: (ctx, index){
         return LISTVIEW(ruyxat[index], nowDay, deleteXisob);
      }, itemCount: ruyxat.length,) : Column(
        children: [
          // SizedBox(height: 9,),
          Text("Siz daxosiz sizda chiqim yo'q! ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 50,),
          Image.asset("assets/profit.png", width: 200, fit: BoxFit.cover,)
        ],
      )
    );
  }
}