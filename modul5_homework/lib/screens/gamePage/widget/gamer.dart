import 'package:flutter/material.dart';

class GAMER extends StatelessWidget {
  final Color color;
  String imgAvatar, imgXorO;
  //Color(0xFF1263FF)
  GAMER(this.color, this.imgAvatar, this.imgXorO);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 121,
      height: 177,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset(
          imgAvatar,
          width: 73,
          height: 86.26,
        ),
        Container(
          width: 77,
          height: 2.24,
          color: Colors.white,
        ),
        Image.asset(
          imgXorO,
          width: 28.53,
          height: 40,
        )
      ]),
    );
  }
}
