import 'package:flutter/material.dart';
import 'package:modul4_8/models/reja_modeli.dart';

class TODO extends StatelessWidget {
  final RejaModeli reja;
  final Function changeIsDoneById, deleteToDo;

  TODO(this.reja, this.changeIsDoneById, this.deleteToDo);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),

      leading: IconButton(
        icon: reja.isDone ? Icon(Icons.check_circle_outline, color: Colors.green,)
        :Icon(Icons.circle_outlined) , 
          onPressed: (){changeIsDoneById(reja.rID);},),
      
      title: Text("${reja.name}", style: TextStyle(color: reja.isDone ? Colors.grey : Colors.black ,decoration: reja.isDone ? TextDecoration.lineThrough : TextDecoration.none),),
      
      trailing: IconButton(onPressed: (){deleteToDo(reja.rID);}, icon: Icon(Icons.delete_forever), color: Colors.red,),
    );
  }
}