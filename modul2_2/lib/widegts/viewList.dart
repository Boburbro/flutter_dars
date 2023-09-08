import 'package:flutter/material.dart';

class UserItemView extends StatelessWidget {
  final String id, ismi, telefon, rasmURL;

  UserItemView(
    {
      required this.id,
      required this.ismi, 
      required this.telefon, 
      required this.rasmURL,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(rasmURL),
        ),
        title: Text(ismi, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        subtitle: Text(telefon),
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