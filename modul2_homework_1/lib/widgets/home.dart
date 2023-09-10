import 'package:flutter/material.dart';
import 'package:modul2_homework_1/widgets/appBar.dart';
import 'package:modul2_homework_1/widgets/items.dart';

class HOME extends StatefulWidget {
  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  List<Map<String, String>> JSON = [
    {
      'id':'1',
      'name': 'Samsung s23 ultra',
      'narxi': '\$1200',
      'url':'https://images.pexels.com/photos/16149964/pexels-photo-16149964/free-photo-of-get-ready-for-the-future-with-samsung-galaxy-s23.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'id':'2',
      'name': 'Samsung s22 ultra',
      'narxi': '\$900',
      'url':'https://images.pexels.com/photos/13780425/pexels-photo-13780425.jpeg?auto=compress&cs=tinysrgb&w=1600'
    },
  ];

  void ReItem(id){
    setState(() {
      JSON.removeWhere((item){
        return id == item['id'];
    });
    });
    print(JSON);
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25,),
        APPBAR(),
        SizedBox(height: 25,),
        Expanded(
          child: ListView(
            itemExtent: 90,
            children: JSON.map((item){
              return ITEMS(
                id: item['id']!,
                name: item['name']!, 
                narx: item['narxi']!, 
                url: item['url']!,
                removeItem: ReItem,
                );
            }).toList(),
          )
        )
        
      ],
    );
  }
}