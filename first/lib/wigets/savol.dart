import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Savol extends StatelessWidget {
  final String savol;
  final List<Map<String, dynamic>> javoblar;
  Function savolJavob;

  Savol(this.savol, this.javoblar, this.savolJavob);

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(savol, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                
                ElevatedButton(onPressed: () => savolJavob(javoblar[0]['togrimi']), child: Text(javoblar[0]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: () => savolJavob(javoblar[1]['togrimi']), child: Text(javoblar[1]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: () => savolJavob(javoblar[2]['togrimi']), child: Text(javoblar[2]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
                ElevatedButton(onPressed: () => savolJavob(javoblar[3]['togrimi']), child: Text(javoblar[3]['matn'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),
              ],
            );
  }
}