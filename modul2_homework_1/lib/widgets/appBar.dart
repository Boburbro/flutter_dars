import 'package:flutter/material.dart';

class APPBAR extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ro'yxat", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
          ],
        );
  }
}