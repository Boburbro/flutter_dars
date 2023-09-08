import 'package:flutter/material.dart';
import 'package:modul2_2/widegts/viewList.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "data", 
                  style: TextStyle(
                    fontSize: 25, 
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
           Expanded(
                child: ListView(
                  itemExtent: 80,
                  children: [
                    UserItemView(
                      id: "1",
                      ismi: "Anna",
                      telefon: "25-24-225",
                      rasmURL: "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1600",
                    ),
                  ],
                ),
              )
            ],
          )
        ),
       
    );
  }
}