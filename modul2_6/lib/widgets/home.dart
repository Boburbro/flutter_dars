import 'package:flutter/material.dart';
import 'package:modul2_6/widgets/appBar.dart';
import 'package:modul2_6/widgets/userItems.dart';

class HOME extends StatefulWidget {
  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  List<Map<String, String>> JSON = [
    {
      "id":"user1",
      "ism":"Mix",
      "phone":"90.55-41-35",
      "url":"https://media.istockphoto.com/id/1289220545/photo/beautiful-woman-smiling-with-crossed-arms.jpg?s=1024x1024&w=is&k=20&c=wobHCIC8ARiLxB4rmznE6JixLVRNtHHOzP366loetck="
    },
    {
      "id":"user2",
      "ism":"Ann",
      "phone":"82-7899-11",
      "url":"https://img.freepik.com/free-photo/side-view-male-hacker-with-gloves-laptop_23-2148578161.jpg?w=1060&t=st=1694176485~exp=1694177085~hmac=8c24d83966cc0314348a52d891c98f8db612e1f14a374cfd07fcb968d264c6c3"
    },
    {
      "id":"user3",
      "ism":"Tim",
      "phone":"809-23-2311",
      "url":"https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "id":"user4",
      "ism":"John",
      "phone":"955-41-35",
      "url":"https://images.pexels.com/photos/3966276/pexels-photo-3966276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "id":"user5",
      "ism":"Bob",
      "phone":"82-75599-11",
      "url":"https://images.pexels.com/photos/3657520/pexels-photo-3657520.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "id":"user6",
      "ism":"What",
      "phone":"809-23-3311",
      "url":"https://images.pexels.com/photos/3214785/pexels-photo-3214785.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "id":"user7",
      "ism":"Hasan",
      "phone":"90.55-41-35",
      "url":"https://images.pexels.com/photos/1906156/pexels-photo-1906156.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "id":"user8",
      "ism":"Ali",
      "phone":"82-7899-11",
      "url":"https://img.freepik.com/free-photo/side-view-male-hacker-with-gloves-laptop_23-2148578161.jpg?w=1060&t=st=1694176485~exp=1694177085~hmac=8c24d83966cc0314348a52d891c98f8db612e1f14a374cfd07fcb968d264c6c3"
    },
    {
      "id":"user9",
      "ism":"Husan",
      "phone":"809-23-2311",
      "url":"https://images.pexels.com/photos/2267117/pexels-photo-2267117.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "id":"user10",
      "ism":"Niki",
      "phone":"955-41-35",
      "url":"https://media.istockphoto.com/id/1289220545/photo/beautiful-woman-smiling-with-crossed-arms.jpg?s=1024x1024&w=is&k=20&c=wobHCIC8ARiLxB4rmznE6JixLVRNtHHOzP366loetck="
    },
    {
      "id":"user11",
      "ism":"G'apor",
      "phone":"82-75599-11",
      "url":"https://images.pexels.com/photos/17427379/pexels-photo-17427379/free-photo-of-a-pelican-by-a-sea.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "id":"user12",
      "ism":"Nolik",
      "phone":"809-23-3311",
      "url":"https://img.freepik.com/free-photo/side-view-male-hacker-with-gloves-laptop_23-2148578161.jpg?w=1060&t=st=1694176485~exp=1694177085~hmac=8c24d83966cc0314348a52d891c98f8db612e1f14a374cfd07fcb968d264c6c3"
    },
  ];

  void deleteUser(String user_id){
    setState(() {
      JSON.removeWhere((user){
        return user['id'] == user_id;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        APPBAR(),
        SizedBox(height: 20,),
        Expanded(
          child: ListView(
            itemExtent: 90,
            children: JSON.map((user){
              return UserItem(
                user_id: user['id']!,
                ism: user["ism"]!, 
                phone: user['phone']!, 
                rasmUrl: user['url']!,
                deleteUser: deleteUser,
              );
            }).toList(),
          )
        )
      ],
    );
  }
}