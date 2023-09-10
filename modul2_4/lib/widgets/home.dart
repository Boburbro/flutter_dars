import 'package:flutter/material.dart';
import 'package:modul2_4/widgets/appBar.dart';
import 'package:modul2_4/widgets/userItems.dart';

class HOME extends StatelessWidget {
  List<Map<String, String>> JSON = [
    {
      "id":"user1",
      "ism":"Sabinaxon",
      "phone":"(998)90.364-41-35",
      "url":"https://media.istockphoto.com/id/1289220545/photo/beautiful-woman-smiling-with-crossed-arms.jpg?s=1024x1024&w=is&k=20&c=wobHCIC8ARiLxB4rmznE6JixLVRNtHHOzP366loetck="
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        APPBAR(),
        Expanded(
          child: ListView(
            itemExtent: 80,
            children: JSON.map((user){
              return UserItem(
                ism: user["ism"]!, 
                phone: user['phone']!, 
                rasmUrl: user['url']!
              );
            }).toList(),
          )
        )
      ],
    );
  }
}