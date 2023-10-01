import 'package:flutter/material.dart';
import 'package:modul4_8/HOMEPAGE/todo.dart';
import 'package:modul4_8/models/reja_modeli.dart';

class TODOLIST extends StatelessWidget {
  final List<RejaModeli> rejalar;
  final Function changeIsDoneById,deleteToDo;

  TODOLIST(this.rejalar, this.changeIsDoneById, this.deleteToDo);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: rejalar.length > 0 ? ListView.builder(
        itemBuilder: (ctx, index){
          return TODO(rejalar[index], changeIsDoneById, deleteToDo);
        },
        itemCount: rejalar.length,
        ) : Column(
        children: [
          Text("Hozircha rejalar yo'q, uxlimiz!", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Image.asset("assets/sleeping.png", width: 200, fit: BoxFit.cover,)
        ]
      ),
    );
  }
}