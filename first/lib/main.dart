import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String savol = "Savol 1";
  void savolJavob(){
    setState(() {
      savol = "savol 2";
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz app"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(savol, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                
                ElevatedButton(onPressed: savolJavob, child: Text("javob 1", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text("javob 2", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text("javob 3", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text("javob 4", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
              ],
              ),
          ),
        ),
    );
  }
}