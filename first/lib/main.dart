import 'package:first/wigets/natija.dart';
import 'package:first/wigets/savol.dart';
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
  List<Map<String, dynamic>> Savollar = [
    {
      "savol":"1.What ____ your name?",
      "javoblar":
      [
        {"matn":"are", "togrimi": false},
        {"matn":"is", "togrimi": true},
        {"matn":"am", "togrimi": false},
        {"matn":"was", "togrimi": false},
      ]
    },
    {
      "savol":"2. How ___ you?",
      "javoblar":[
        {"matn":"is", "togrimi":false},
        {"matn":"are", "togrimi":true},
        {"matn":"it", "togrimi":false},
        {"matn":"am", "togrimi":false},
      ]
    },
    {
      "savol":"3. How are ___ ?",
      "javoblar":[
        {"matn":"am", "togrimi":false},
        {"matn":"is", "togrimi":false},
        {"matn":"they", "togrimi":true},
        {"matn":"not", "togrimi":false},
      ]
    },
    {
      "savol":"4. Which color ___ you like ?",
      "javoblar":[
        {"matn":"do", "togrimi":true},
        {"matn":"black", "togrimi":false},
        {"matn":"they", "togrimi":false},
        {"matn":"not", "togrimi":false},
      ]
    },
    
  ];

  int hozirgiRaqam = 0;
  int natija = 0;
  void savolJavob(bool togrimi){
    if (togrimi){
      natija++;
    }
    setState(() {
      hozirgiRaqam++;
    });
  }

  void RestartApp(){
    setState(() {
      natija = 0;
      hozirgiRaqam = 0;
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
            child: hozirgiRaqam < Savollar.length ? Savol(
              Savollar[hozirgiRaqam]['savol'],
              Savollar[hozirgiRaqam]["javoblar"],
               savolJavob
               ) : Natija(natija, Savollar.length, RestartApp),
          ),
        ),
    );
  }
}