import 'package:flutter/material.dart';
import 'package:modul5_homework/screens/gamePage/widget/game_cont.dart';
import 'package:modul5_homework/screens/gamePage/widget/gamer.dart';

class GAMEPAGE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Tic Tac Toe",
              style: TextStyle(
                  color: Color(0xFF0057FF),
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 52),
              child: Container(
                width: double.infinity,
                height: 12,
                decoration: BoxDecoration(
                    color: Color(0xFFFF0000),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GAMER(Color(0xFF1263FF), "assets/gamer_x.png", "assets/X.png"),
                GAMER(Color(0xFFEF5F5F), "assets/gamer_y.png", "assets/o_red.png"),
              ],
            ),
            GAME_CONT()
          ],
        ),
      ),
    );
  }
}
