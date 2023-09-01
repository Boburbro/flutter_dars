import 'package:flutter/material.dart';

class Natija extends StatelessWidget {
  final int natija;
  final int SavolUzunligi;
  final Function() RestartApp;

  Natija(this.natija, this.SavolUzunligi, this.RestartApp);

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sizning natijangiz: $natija / $SavolUzunligi", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  ElevatedButton.icon(onPressed: RestartApp, icon: Icon(Icons.restart_alt), label: Text("Qaytadan boshlash"))
              ],
            ),);
  }
}