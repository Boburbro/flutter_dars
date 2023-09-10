import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String ism;
  final String phone;
  final String rasm;

  UserItem({
    required this.ism,
    required this.phone,
    required this.rasm
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(radius: 25, backgroundImage: NetworkImage(rasm),),
        title: Text(ism, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
        subtitle: Text(phone),
        trailing: IconButton(icon: Icon(Icons.delete_forever), color: Colors.red, onPressed: () {},),
      ),
    );
  }
}