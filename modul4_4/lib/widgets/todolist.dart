import 'package:flutter/material.dart';

class todoList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: ListView.builder(itemBuilder: (ctx, index){
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    leading: IconButton(icon: Icon(Icons.circle_outlined), onPressed: (){},),
                    title: Text("ToDo", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                    trailing: IconButton(icon: Icon(Icons.delete_forever_rounded, size: 20,), onPressed: (){},),
                  );
                },
                itemCount: 10,),
              );
  }
}