import 'package:flutter/material.dart';
import 'package:modul6_homework/screens/game/appBar.dart';
import 'package:modul6_homework/screens/game/fiedl.dart';
import 'package:modul6_homework/screens/game/icons.dart';

class GAMEBUILDER extends StatelessWidget {
  double _iconSize = 35;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        APPBAR(ICONS(_iconSize)),
        FIELD(),
      ],
    );
  }
}
