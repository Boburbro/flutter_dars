import 'package:flutter/material.dart';
import 'package:modul5_4/card.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HOME(),
    );
  }
}

class HOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: BODY(),
    );
  }
}

class BODY extends StatefulWidget {
  @override
  State<BODY> createState() => _BODYState();
}

class _BODYState extends State<BODY> {
  List<String> ismlar = [
    "1.Sanjar",
    "2.Sardor",
    "3.Ali",
    "4.Hasan",
    "5.Bobur",
    "6.Fotima",
    "7.Zuxra"
  ];

  void deletee(ism) {
    setState(() {
      ismlar.removeWhere((element) {
        return element == ism;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 300,
      children: ismlar.map((ism) {
        print(ism);
        return CARDINIT(ism, deletee, key: ValueKey(ism),);
      }).toList(),
    );
  }
}


/* 

  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 300,
      children: ismlar.map((ism) {
        print(ism);
        return CARDINIT(ism);
      }).toList(),
    );
  }

    Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        print(ismlar[index]);
        return CARDINIT(ismlar[index], deletee, key: ValueKey(ismlar[index]),);
      },
      itemCount: ismlar.length,
      itemExtent: 300,
    );
  }

Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index){
      print(ismlar[index]);
      return CARDINIT(ismlar[index]);
    },
    itemCount: ismlar.length,
    itemExtent: 300,);
  }
*/