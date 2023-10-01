import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modul4_homework1/models/hamyon.dart';

class LISTVIEW extends StatelessWidget {
  final Hamyon ruyxat;
  final DateTime nowDay;
  final Function deleteXisob;

  LISTVIEW(this.ruyxat, this.nowDay, this.deleteXisob);  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.amber,),
      title: Text("${ruyxat.nomi}, ${ruyxat.summa} so'm"),
      subtitle: Text("${DateFormat('d MMMM, yyy').format(nowDay)}   10 January, 2023"),
      trailing: IconButton(icon: Icon(Icons.delete_forever, color: Colors.red,), onPressed: (){deleteXisob(ruyxat.rId);},),
                );
  }
}