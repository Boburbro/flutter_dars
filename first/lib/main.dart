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
  String javob1 = "javob 1 s1";
  String javob2 = "javob 2 s1";
  String javob3 = "javob 3 s1";
  String javob4 = "javob 4 s1";
  int hozirgiRaqam = 2;
  void savolJavob(){
    setState(() {
      if (hozirgiRaqam==2){
        savol = "savol 2";
        javob1 = "javob 1 s2";
        javob2 = "javob 2 s2";
        javob3 = "javob 3 s2";
        javob4 = "javob 4 s2";
      }else if (hozirgiRaqam==3){
        savol = "savol 3";
        javob1 = "javob 1 s3";
        javob2 = "javob 2 s3";
        javob3 = "javob 3 s3";
        javob4 = "javob 4 s3";
      }
      
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(savol, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                
                ElevatedButton(onPressed: savolJavob, child: Text(javob1, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text(javob2, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text(javob3, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: savolJavob, child: Text(javob4, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
        ),
    );
  }
}