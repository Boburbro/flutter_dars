import 'package:flutter/material.dart';
import 'package:modul5_homework/widget/kvadrat.dart';

class GAME_CONT extends StatefulWidget {
  @override
  State<GAME_CONT> createState() => _GAME_CONTState();
}

class _GAME_CONTState extends State<GAME_CONT> {
  // List<String> _board = [];
  // String _currentPlayer = 'x';
  // String winner = "";

  // @override
  // void initState() {
  //   _board = List.filled(9, "");

  //   // TODO: implement initState
  //   super.initState();
  // }

  // void _switchPlayer() {
  //   _currentPlayer = _currentPlayer == 'x' ? 'o' : 'x';
  // }

  // void _playMove(int index) {
  //   if (_board[index] == '') {
  //     setState(() {
  //       _board[index] = _currentPlayer;
  //       _switchPlayer();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 419,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFF0000), Color(0xFF0080F6)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KVADRAT(),
              KVADRAT(),
              KVADRAT(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KVADRAT(),
              KVADRAT(),
              KVADRAT(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KVADRAT(_playMove),
              KVADRAT(_playMove),
              KVADRAT(_playMove),
            ],
          ),
        ],
      ),
    );
  }
}
