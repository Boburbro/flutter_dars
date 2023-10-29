import 'package:flutter/material.dart';
import 'package:modul6_homework/screens/game/gamepage.dart';

class ICONS extends StatelessWidget {
  final double _iconSize;
  ICONS(this._iconSize);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: _iconSize,
            )),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GAMEPAGE(),
                ),
              );
            },
            icon: Icon(
              Icons.restart_alt_outlined,
              size: _iconSize,
            )),
      ],
    );
  }
}
