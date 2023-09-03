import 'package:flutter/material.dart';

class NATIJA extends StatelessWidget {
  final dynamic matn;
  final dynamic natija;
  final dynamic JSON;
  final Function() restartApp;

  NATIJA(this.matn, this.natija, this.JSON, this.restartApp);

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$natija/${JSON.length}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                Text("$matn", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                
                ElevatedButton.icon(onPressed: restartApp, icon: Icon(Icons.restart_alt), label: Text("Restart")),
              ],
            ),
          );
  }
}