import 'package:flutter/material.dart';
import 'package:modul5_homework/widget/button_play.dart';
import 'package:modul5_homework/widget/welcome.dart';

class HOMEPAGE extends StatelessWidget {
  void openDialog(BuildContext context) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Text("Keyingi oyna"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WELCOME(),
            BUTTOM_PLAY(),
          ],
        ),
      ),
    );
  }
}
