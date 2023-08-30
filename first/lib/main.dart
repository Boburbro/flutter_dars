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
    {
      "savol":"5. I __ tall",
      "javoblar":[
        {"matn":"is", "togrimi":false},
        {"matn":"was", "togrimi":false},
        {"matn":"not", "togrimi":false},
        {"matn":"am", "togrimi":true},
      ]
    }
  ];

  int hozirgiRaqam = 0;
  void savolJavob(){
    setState(() {
      hozirgiRaqam++;
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
            child: hozirgiRaqam < Savollar.length ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(Savollar[hozirgiRaqam]['savol'], style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                
                ElevatedButton(onPressed: savolJavob, child: Text(Savollar[hozirgiRaqam]['javoblar'][0]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text(Savollar[hozirgiRaqam]['javoblar'][1]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text(Savollar[hozirgiRaqam]['javoblar'][2]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text(Savollar[hozirgiRaqam]['javoblar'][3]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
              ],
            ) : Center(child: Text("Savollar tugab qoldiyu :)", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
          ),
        ),
    );
  }
}