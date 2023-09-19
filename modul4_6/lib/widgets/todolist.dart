import 'package:flutter/material.dart';
import 'package:modul4_6/models/reja_modeli.dart';
import './todos.dart';
class TODOLIST extends StatelessWidget {
  final List<RejaModeli> rejalar;

  TODOLIST(this.rejalar);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (ctx, index){
        return todos(rejalar[index]);
      },
      itemCount: rejalar.length,),
    );
  }
}
 