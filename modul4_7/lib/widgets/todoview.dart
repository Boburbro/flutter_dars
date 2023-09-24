import 'package:flutter/material.dart';
import 'package:modul4_7/models/reja_modeli.dart';

class TODOVIEW extends StatelessWidget {
  final RejaModeli reja;
  final Function belgilash, deleteToDo;


  TODOVIEW(
    this.reja,
    this.belgilash,
    this.deleteToDo
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),

    
      leading: IconButton(
        onPressed: () {
          belgilash(reja.id);
        }, icon: Icon(
          reja.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
          color: reja.isDone ? Colors.green : Colors.grey
          ),
      ),
      title: Text(
        "${reja.nomi}",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          decoration: reja.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          color: reja.isDone ? Colors.grey : Colors.black
        ),
        ),

      trailing: IconButton(
        onPressed: () {
          deleteToDo(reja.id);
        }, icon: Icon(Icons.delete_forever, color: Colors.red),
      ),
    );
  }
}