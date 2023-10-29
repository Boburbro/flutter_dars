import 'package:flutter/material.dart';
import 'package:modul6_homework/screens/game/gamebuilder.dart';
import 'package:modul6_homework/screens/background.dart';
// import 'package:modul6_homework/screens/game/fiedl.dart';

class GAMEPAGE extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: BACKGROUND(GAMEBUILDER()),
      ),
    );
  }
}

