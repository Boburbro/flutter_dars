import 'package:flutter/material.dart';
import 'package:modul5_homework/screens/gamePage/gamePage.dart';

class BUTTOM_PLAY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => GAMEPAGE()));
      },
      child: Container(
        width: 204,
        height: 50,
        // color: Colors.amber,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: const Center(
          child: Text(
            "Let's play",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
