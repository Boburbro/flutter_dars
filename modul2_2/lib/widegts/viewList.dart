import 'package:flutter/material.dart';

class UserItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage("https://yt3.googleusercontent.com/ytc/AOPolaQ4-CWs1qmtt_r7jqGLE0j82QjRG9KltN0hRIRN=s900-c-k-c0x00ffffff-no-rj"),
        ),
        title: Text("Flutter", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        subtitle: Text("+998 90-364-41-35"),
        trailing: IconButton(
          color: Colors.red,
          icon: Icon(
            Icons.delete_forever
            ), 
          onPressed: () {},),
      ),
    );
  }
}