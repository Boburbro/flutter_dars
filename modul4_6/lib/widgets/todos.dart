import 'package:flutter/material.dart';
import 'package:modul4_6/models/reja_modeli.dart';
class todos extends StatelessWidget {

  final RejaModeli reja;

  todos(this.reja);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.circle_outlined),),
      title: Text(reja.nomi, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_rounded, size: 20,),),
    );
  }
} 