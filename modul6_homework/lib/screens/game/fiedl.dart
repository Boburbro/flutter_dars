import 'package:flutter/material.dart';

class FIELD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 345,
          height: 333,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [
                Color(0xFF0061FF),
                Color(0xFF60EFFF),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        )
      ],
    );
  }
}
