import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "Faktlarni ko'rish uchun tugmani bosing!";
  void onPass(){
    setState(() {
      text = "Bu yerda fakt bo'lishi kerak edi";
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Homework"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(text, style: TextStyle(fontSize: 30),),
                ElevatedButton(onPressed: onPass, child: Text("Bosing")),
              ],
            ),
        ),
        ),
    );
  }
}