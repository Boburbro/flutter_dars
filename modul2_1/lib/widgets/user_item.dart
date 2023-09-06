import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                      ),
                      title: Text("Bobur", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      subtitle: Text("+998 90-364-41-35"),
                      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Colors.red, size: 25,),),
                    ),
                  );
  }
}