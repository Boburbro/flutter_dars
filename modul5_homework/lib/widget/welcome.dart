import 'package:flutter/material.dart';

class WELCOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/tictactoe.png",
          width: 85,
          height: 167,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/X.png",
              width: 82,
              height: 76,
            ),
            const SizedBox(
              width: 23,
            ),
            Image.asset(
              "assets/o.png",
              width: 82,
              height: 76,
            ),
          ],
        ),
      ],
    );
  }
}
