import 'package:flutter/material.dart';
import 'package:modul5_homework/screens/gamePage/widget/kvadrat.dart';

class GAME_CONT extends StatefulWidget {
  @override
  State<GAME_CONT> createState() => _GAME_CONTState();
}

class _GAME_CONTState extends State<GAME_CONT> {
  Map<String, String> board = {
    "a1": " ",
    "a2": " ",
    "a3": " ",
    "b1": " ",
    "b2": " ",
    "b3": " ",
    "c1": " ",
    "c2": " ",
    "c3": " ",
  };
  String _currentPlayer = 'x';
  String winner = "";
  bool isGaming = true;

  // @override
  // void initState() {
  //   _board = List.filled(9, "");

  //   // TODO: implement initState
  //   super.initState();
  // }

  void _switchPlayer() {
    _currentPlayer = _currentPlayer == 'x' ? 'o' : 'x';
  }

  void chackGame() {
    if (board['a1'] != " " && board['a2'] != " " && board['a3'] != " ") {
      if (board["a1"] == board["a2"] && board["a1"] == board["a3"]) {
        openRestartDialog();
      }
    }
    if (board['b1'] != " " && board['b2'] != " " && board['b3'] != " ") {
      if (board["b1"] == board["b2"] && board["b1"] == board["b3"]) {
        openRestartDialog();
      }
    }
    if (board['c1'] != " " && board['c2'] != " " && board['c3'] != " ") {
      if (board["c1"] == board["c2"] && board["c1"] == board["c3"]) {
        openRestartDialog();
      }
    }
    if (board['a1'] != " " && board['b1'] != " " && board['c1'] != " ") {
      if (board["a1"] == board["b1"] && board["a1"] == board["c1"]) {
        openRestartDialog();
      }
    }
    if (board['a2'] != " " && board['b2'] != " " && board['c2'] != " ") {
      if (board["a2"] == board["b2"] && board["a2"] == board["c2"]) {
        openRestartDialog();
      }
    }
    if (board['a3'] != " " && board['b3'] != " " && board['c3'] != " ") {
      if (board["a3"] == board["c3"] && board["b3"] == board["c3"]) {
        openRestartDialog();
      }
    }
    if (board['a1'] != " " && board['b2'] != " " && board['c3'] != " ") {
      if (board['a1'] == board['b2'] && board['c3'] == board['a1']) {
        openRestartDialog();
      }
    }
    if (board['a3'] != " " && board['b2'] != " " && board['c1'] != " ") {
      if (board['a3'] == board['b2'] && board['c1'] == board['a3']) {
        openRestartDialog();
      }
    }
  }

  void getRid(rID) {
    // print(rID);
    if (board[rID] == " ") {
      setState(() {
        _switchPlayer();
        board[rID] = '$_currentPlayer';
      });
      // print(board[rID]);
    }
    chackGame();
  }

  _playMove(rId) {
    return board[rId];
    // return rId[rId];

    // return "";
  }

  void openRestartDialog() {
    String loster = _currentPlayer == 'x' ? 'o' : 'x';

    setState(() {
      isGaming = false;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('tle'),
          content: Text("GAME OVER\n"
              "Won: $_currentPlayer\n"
              "Lost: $loster"),

          actions: [
            TextButton(
                onPressed: () {
                  restartGame();
                  Navigator.pop(context);
                },
                child: Text("RESTART")),
          ],
        );
      },
    );
  }

  void restartGame() {
    setState(() {
      isGaming = true;
      board = {
        "a1": " ",
        "a2": " ",
        "a3": " ",
        "b1": " ",
        "b2": " ",
        "b3": " ",
        "c1": " ",
        "c2": " ",
        "c3": " ",
      };
    });
  }

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
          for (var i in ["a", "b", "c"])
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var j in [1, 2, 3])
                  KVADRAT("$i$j", _playMove('$i$j'), getRid, isGaming,
                      openRestartDialog),
              ],
            ),
        ],
      ),
    );
  }
}
