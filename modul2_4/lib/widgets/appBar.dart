import 'package:flutter/material.dart';

class APPBAR extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("data", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
      ],
    );
  }
}