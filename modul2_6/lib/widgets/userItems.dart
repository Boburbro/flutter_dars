import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String user_id;
  final String ism;
  final String phone;
  final String rasmUrl;
  final Function deleteUser;

  UserItem(
    {
      required this.user_id,
      required this.ism,
      required this.phone,
      required this.rasmUrl,
      required this.deleteUser

    }
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Center(
        child: ListTile(
          title: Text(ism, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          subtitle: Text(phone),
          trailing: IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: () {
              deleteUser(user_id);
            }, 
            color: Colors.red,
            ),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(rasmUrl)
          ),
        ),
      ),
    );
  }
}