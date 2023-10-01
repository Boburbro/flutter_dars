import 'package:flutter/material.dart';
import 'package:modul4_7/models/reja_modeli.dart';
import 'package:modul4_7/widgets/todoview.dart';

class TODOLIST extends StatelessWidget {
  final List<RejaModeli> rejalar;
  final Function belgilash, deleteToDo;

  TODOLIST(this.rejalar, this.belgilash, this.deleteToDo);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: rejalar.length > 0 ? ListView.builder(itemBuilder: (ctr, index){
        return TODOVIEW(rejalar[index], belgilash, deleteToDo);
      },
      itemCount: rejalar.length,) : Column(
        children: [
          Text("Hozircha rejalar yo'q, uxlimiz!", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Image.asset("assets/imgs/sleeping.png", width: 200, fit: BoxFit.cover,)
        ]
      ) ,
    );
  }
}