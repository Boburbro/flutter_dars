import 'package:flutter/material.dart';
import 'package:modul2_3/widgets/usersItem.dart';

class HOME extends StatelessWidget {
  List<Map<String, String>> JSON = [
    {
      "ism":"Ann",
      "phone":"82-7899-11",
      "img":"https://img.freepik.com/free-photo/side-view-male-hacker-with-gloves-laptop_23-2148578161.jpg?w=1060&t=st=1694176485~exp=1694177085~hmac=8c24d83966cc0314348a52d891c98f8db612e1f14a374cfd07fcb968d264c6c3"
    },
    {
      "ism":"Tim",
      "phone":"809-23-2311",
      "img":"https://img.freepik.com/free-photo/side-view-male-hacker-with-gloves-laptop_23-2148578161.jpg?w=1060&t=st=1694176485~exp=1694177085~hmac=8c24d83966cc0314348a52d891c98f8db612e1f14a374cfd07fcb968d264c6c3"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("data", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
              ],
            ),

            Expanded(
              child: ListView(
                children: JSON.map((user){
                  return UserItem(
                    ism: user['ism']!, 
                    phone: user['phone']!, 
                    rasm: user['img']!
                  );
                }).toList() 
                ,
              )
            ),
          ],
        );
      }
}