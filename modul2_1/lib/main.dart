import 'package:flutter/material.dart';
import 'package:modul2_1/widgets/user_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FoydalanuvchilarRoyxati());
  }
}

class FoydalanuvchilarRoyxati extends StatelessWidget {


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
                Text("hello", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ],
            ),
            Expanded(
              child: ListView(
                
                itemExtent: 80,
                children: [
                  UserItem(),
                  UserItem(),
                  UserItem(),
                  UserItem(),
                  UserItem(),
                  UserItem(),
                  UserItem(),
                  UserItem(),
                  UserItem(),
                  UserItem(),
                ],
              ),
            )
          ],
        ),
        
        ),
    );
  }
}