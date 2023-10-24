import 'package:flutter/material.dart';

class KVADRAT extends StatefulWidget {
  final Function play;

  KVADRAT(this.play);

  @override
  State<KVADRAT> createState() => _KVADRATState();
}

class _KVADRATState extends State<KVADRAT> {
  bool isX = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.play(1);
        });
      },
      child: Container(
        width: 93,
        height: 103,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 73.15,
          height: 74,
          child: isX ? Image.asset("assets/X.png") : Image.asset("assets/o.png"),
        ),
      ),
    );
  }
}
