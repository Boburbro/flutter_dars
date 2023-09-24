import 'package:flutter/material.dart';
import 'package:modul4_6/models/reja_modeli.dart';
class todos extends StatelessWidget {

  final RejaModeli reja;
  final Function belgila, deleteToDo;

  todos(this.reja, this.belgila, this.deleteToDo);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: IconButton(onPressed: (){
        belgila(reja.id);
      }, icon: Icon(
        reja.isDane ? Icons.check_circle_outline : Icons.circle_outlined,
        color: reja.isDane ? Colors.green : Colors.grey 
        
        ),),
      title: Text(
        reja.nomi, 
        style: TextStyle(
          fontSize: 15, 
          fontWeight: FontWeight.w600,
          decoration: reja.isDane ? TextDecoration.lineThrough : TextDecoration.none,
          color: reja.isDane ? Colors.grey : Colors.black,
          ),
        ),
      trailing: IconButton(onPressed: (){
        deleteToDo(reja.id);
      }, icon: Icon(Icons.delete_forever_rounded, size: 20,),),
    );
  }
} 