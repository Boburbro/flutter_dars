import 'package:flutter/material.dart';

class TODOLIST extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (ctx, index){
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.circle_outlined),),
          title: Text("Hello", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_rounded, size: 20,),),
        );
      },
      itemCount: 5,),
    );
  }
}