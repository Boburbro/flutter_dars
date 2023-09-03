import 'package:flutter/material.dart';
import 'package:homework_first_modul/widgets/savol.dart';
import 'widgets/natija.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> JSON = [
    {
      "savol":"What ___ your name?",
      "javoblar":[
        {"matn":"are", "togrimi":false},
        {"matn":"am", "togrimi":false},
        {"matn":"not", "togrimi":false},
        {"matn":"is", "togrimi":true},
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
  

  int hozirgiraqam = 0;
  int natija = 0; 
  // ignore: non_constant_identifier_names
  String getMatn(int natija, int SavollarUzunligi){
    if(natija == SavollarUzunligi){
      return "Siz bitta ham xato qilmadingiz!";
    }else if(natija == 0){
      return "Siz savolarni bittasiga ham javob bera olmadingiz. Qayta urining va ko'proq takrorlang";
    }else if (natija > SavollarUzunligi/2){
      return "Sizning ko'rsatkichlaringiz juda yaxshi!";
    }else if(natija < SavollarUzunligi/2){
      return "Sizning ko'rsatkichlaringiz juda past! qaytadan urinib ko'ring!";
    }else{
      return "Xatolik bor";
    }

  }
  void onPass(bool togrirm){
    if (togrirm){
      natija++;
    }
    setState(() {
      hozirgiraqam++;
    });
  }
  void restartApp(){
    setState(() {
      hozirgiraqam = 0;
      natija = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(JSON.length);
    String matn = getMatn(natija, JSON.length);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Homework")),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: hozirgiraqam < JSON.length ? SAVOL(JSON, hozirgiraqam, onPass) : NATIJA(matn, natija, JSON, restartApp)
        ),
      ),
    );
  }
}