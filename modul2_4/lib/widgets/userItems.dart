import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String ism;
  final String phone;
  final String rasmUrl;

  UserItem(
    {
      required this.ism,
      required this.phone,
      required this.rasmUrl,

    }
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(ism, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        subtitle: Text(phone),
        trailing: IconButton(icon: Icon(Icons.delete_forever), onPressed: () {}, color: Colors.red,),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(rasmUrl)
        ),
      ),
    );
  }
}