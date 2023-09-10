import 'package:flutter/material.dart';

class ITEMS extends StatelessWidget {
  final String name, narx, url, id;
  final Function removeItem;

  ITEMS({
    required this.name, 
    required this.narx, 
    required this.url,
    required this.id,
    required this.removeItem
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
            child: Center(
              child: ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(url)),
                title: Text(name),
                subtitle: Text(narx),
                trailing: IconButton(onPressed: (){
                  removeItem(id);
                }, icon: Icon(Icons.delete_forever), color: Colors.red, tooltip: 'remove',),
              ),
            ),
          );
  }
}